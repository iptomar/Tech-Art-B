<?php
require "../verifica.php";
require "../config/basedados.php";
require_once "../config/credentials.php";
//Se o utilizador não é um administrador ou o proprio não tem permissão para alterar as publicações
if ($_SESSION["autenticado"] != 'administrador' && $_SESSION["autenticado"] != $_GET["id"]) {
    header("Location: index.php");
}

function formatAuthors($authors)
{
    $authorList = [];
    if (isset($authors->author)) {
        foreach ($authors->author as $author) {
            //Colocar os nomes dos autores no array authorList
            if (isset($author->value)) {
                $authorList[] = $author->value;
            }
        }
    }
    //Devolver uma string com todos os nomes de autores separados um do outro pelo um ' and '
    return implode(' and ', $authorList);
}


// Função para gerar a publicação formartada de forma a poder utilizar o citacion.js para criar a referençia APA
function generatePublicationEntry($id, $fields)
{
    $formattedFields = [];
    $type = $fields["typeName"];
    unset($fields["typeName"]);
    foreach ($fields as $fieldName => $fieldValue) {
        $formattedFields[] = "  $fieldName = {" . addcslashes(addslashes($fieldValue), '{}') . "}";
    }
    return "@" . $type . "{" . $id . "," . implode(", ", $formattedFields) . "}";
}

function generatePageRange($dataOutput, $fromField, $toField)
{
    $pageRange = isset($dataOutput->{$fromField})
        ? $dataOutput->{$fromField} . (isset($dataOutput->{$toField}) ? "--" . $dataOutput->{$toField} : "")
        : (isset($dataOutput->{$toField}) ? $dataOutput->{$toField} : "");

    return $pageRange;
}

//Função que processa a publicação dependo do tipo 
//Retorna as informações a adicionar à BD, a data, o país e a cidade, e um array com os campos no formato que o citacion.js utiliza
function getPublicationInfo($dataOutput, $typeOutput)
{
    $date = null;
    $location = null;
    $year = null;
    //Lidar com os dados dependendo do tipo de publicação
    switch ($typeOutput) {
        case 'journal-article':
            $formatedData = array(
                "typeName" => 'article',
                "title" => $dataOutput->{"article-title"},
                "journal" => $dataOutput->journal,
                "volume" => $dataOutput->volume,
                "number" => $dataOutput->issue,
                "pages" => generatePageRange($dataOutput, "page-range-from", "page-range-to"),
                "year" => isset($dataOutput->{"publication-date"}) ? $dataOutput->{"publication-date"}->year : "",
                "url" => $dataOutput->{"url"},
                "author" => formatAuthors($dataOutput->{"authors"}),
            );

            break;
        case 'journal-issue':
            $formatedData = array(
                "typeName" => 'periodical',
                "title" => addslashes($dataOutput->{"issue-title"}),
                "journal" => addslashes($dataOutput->journal),
                "volume" => $dataOutput->volume,
                "number" => $dataOutput->{"issue-number"},
                "pages" => $dataOutput->{"number-of-pages"},
                "year" => isset($dataOutput->{"publication-date"}) ? $dataOutput->{"publication-date"}->year : "",
                "editor" => formatAuthors($dataOutput->{"editors"}),
                "url" => $dataOutput->{"url"},
            );
            if (isset($dataOutput->{"publication-date"}->day)) {
                $data["date"] = $dataOutput->{"publication-date"}->year  . "-" . $dataOutput->{"publication-date"}->month . "-" . $dataOutput->{"publication-date"}->day;
            }
            break;
        case 'book':
            $formatedData = array(
                "typeName" => 'book',
                "title" => $dataOutput->{"title"},
                "volume" => $dataOutput->volume,
                "edition" => $dataOutput->edition,
                "pages" => $dataOutput->{"number-of-pages"},
                "year" => $dataOutput->{"publication-year"},
                "publisher" => addslashes($dataOutput->{"publisher"}),
                "url" => $dataOutput->{"url"},
                "author" => formatAuthors($dataOutput->{"authors"}),
                "editor" => formatAuthors($dataOutput->{"editors"}),
            );
            break;
        case 'edited-book':
            $formatedData = array(
                "typeName" => 'book',
                "title" => $dataOutput->{"title"},
                "volume" => $dataOutput->volume,
                "edition" => $dataOutput->edition,
                "pages" => $dataOutput->{"number-of-pages"},
                "year" => $dataOutput->{"publication-year"},
                "publisher" => addslashes(addslashes($dataOutput->{"publisher"})),
                "url" => addslashes($dataOutput->url),
                "author" => formatAuthors($dataOutput->{"authors"}),
                "editor" => formatAuthors($dataOutput->{"editors"}),
            );
            break;
        case 'book-chapter':
            $formatedData = array(
                "typeName" => 'inbook',
                "title" => addslashes($dataOutput->{"chapter-title"}),
                "booktitle" => addslashes($dataOutput->{"book-title"}),
                "volume" => $dataOutput->{"book-volume"},
                "edition" => $dataOutput->{"book-edition"},
                "pages" => generatePageRange($dataOutput, "chapter-page-range-from", "chapter-page-range-to"),
                "year" => $dataOutput->{"publication-year"},
                "publisher" => addslashes($dataOutput->{"book-publisher"}),
                "url" => $dataOutput->url,
                "author" => formatAuthors($dataOutput->{"authors"}),
                "editor" => formatAuthors($dataOutput->{"editors"}),
            );
            break;
        case 'book-review':
            $date = $dataOutput->{"date-of-review-publication"};
            $location = $dataOutput->{"book-publication-location"};
            $formatedData = array(
                "typeName" => 'review',
                "title" => addslashes($dataOutput->{"review-title"}),
                "journal" => addslashes($dataOutput->{"published-in"}),
                "volume" => $dataOutput->{"review-volume"},
                "number" => $dataOutput->{"review-issue"},
                "pages" => generatePageRange($dataOutput, "page-range-from", "page-range-to"),
                "year" => isset($dataOutput->{"date-of-review-publication"}) ? $dataOutput->{"date-of-review-publication"}->year : "",
                "publisher" => $dataOutput->{"review-publisher"},
                "url" => $dataOutput->url,
                "booktitle" => addslashes($dataOutput->{"book-title"}),
                "author" => formatAuthors($dataOutput->{"authors"}),
            );
            break;
        case 'translation':
            $formatedData = array(
                "typeName" => 'book',
                "title" => $dataOutput->{"title"},
                "booktitle" => addslashes($dataOutput->{"series-title"}),
                "volume" => $dataOutput->{"volume"},
                "edition" => $dataOutput->{"edition"},
                "pages" => $dataOutput->{"number-of-pages"},
                "year" => $dataOutput->{"publication-year"},
                "publisher" => $dataOutput->{"publisher"},
                "url" => $dataOutput->url,
                "author" => formatAuthors($dataOutput->{"authors"}),
            );
            break;
        case 'dissertation':
            $date = $dataOutput->{"completion-date"};
            //Obter a localização da primeira instituição
            $institution =  isset($dataOutput->institutions) ? $dataOutput->institutions->institution[0] : null;
            $location = isset($institution) ? $institution->{'institution-address'} : null;

            $formatedData = array(
                "typeName" => 'thesis',
                "title" => $dataOutput->{"title"},
                "school" => implode(' and ', array_map(function ($institution) {
                    return $institution->{"institution-name"};
                }, isset($dataOutput->institutions->institution) ? $dataOutput->institutions->institution : array())),
                "year" => isset($dataOutput->{"completion-date"}) ? $dataOutput->{"completion-date"}->year : "",
                "month" => isset($dataOutput->{"completion-date"}) ? $dataOutput->{"completion-date"}->month : "",
                "type" => isset($dataOutput->{"degree-type"}) ? $dataOutput->{"degree-type"}->value : "",
                "url" => $dataOutput->url,
                "author" => formatAuthors($dataOutput->{"authors"}),
            );
            break;
        case 'newspapper-article':
            $formatedData = array(
                "typeName" => 'article',
                "title" => $dataOutput->{"article-title"},
                "journal" => $dataOutput->{"newspaper"},
                "volume" => $dataOutput->{"volume"},
                "number" => $dataOutput->{"edition"},
                "pages" => generatePageRange($dataOutput, "page-range-from", "page-range-to"),
                "year" => isset($dataOutput->{"publication-date"}) ? $dataOutput->{"publication-date"}->year : "",
                "url" => $dataOutput->url,
                "author" => formatAuthors($dataOutput->{"authors"}),
            );
            break;
        case 'newsletter-article':
            $formatedData = array(
                "typeName" => 'article',
                "title" => $dataOutput->{"article-title"},
                "journal" => $dataOutput->{"newsletter"},
                "volume" => $dataOutput->{"volume"},
                "number" => $dataOutput->{"issue"},
                "pages" => generatePageRange($dataOutput, "page-range-from", "page-range-to"),
                "year" => isset($dataOutput->{"publication-date"}) ? $dataOutput->{"publication-date"}->year : "",
                "url" => $dataOutput->url,
                "author" => formatAuthors($dataOutput->{"authors"}),
            );
            break;
        case 'encyclopedia-entry':
            $formatedData = array(
                "typeName" => 'inreference',
                "title" => $dataOutput->{"entry-title"},
                "booktitle" => addslashes($dataOutput->{"encyclopedia-title"}),
                "volume" => $dataOutput->{"volume"},
                "number" => $dataOutput->{"edition"},
                "pages" => generatePageRange($dataOutput, "page-range-from", "page-range-to"),
                "year" => $dataOutput->{"publication-year"},
                "publisher" => $dataOutput->{"publisher"},
                "url" => $dataOutput->url,
                "author" => formatAuthors($dataOutput->{"authors"}),
                "editor" => formatAuthors($dataOutput->{"editors"}),
            );
            break;
        case 'magazine-article':
            $formatedData = array(
                "typeName" => 'article',
                "title" => $dataOutput->{"article-title"},
                "journal" => $dataOutput->{"magazine"},
                "volume" => $dataOutput->{"volume"},
                "number" => $dataOutput->{"issue"},
                "pages" => generatePageRange($dataOutput, "page-range-from", "page-range-to"),
                "year" => isset($dataOutput->{"publication-date"}) ? $dataOutput->{"publication-date"}->year : "",
                "url" => $dataOutput->url,
                "author" => formatAuthors($dataOutput->{"authors"}),
                "editor" => formatAuthors($dataOutput->{"editors"}),
            );
            break;
        case 'dictionary-entry':
            $formatedData = array(
                "typeName" => 'inreference',
                "title" => $dataOutput->{"entry-title"},
                "booktitle" => $dataOutput->{"dictionary-title"},
                "volume" => $dataOutput->{"volume"},
                "pages" => generatePageRange($dataOutput, "page-range-from", "page-range-to"),
                "year" => $dataOutput->{"publication-year"},
                "url" => $dataOutput->url,
                "author" => formatAuthors($dataOutput->{"authors"}),
                "editor" => formatAuthors($dataOutput->{"editors"}),
            );
            break;
        case 'report':
            $date = $dataOutput->{"date-submitted"};
            //Obter a localização da primeira instituição
            $institution = isset($dataOutput->institutions) ?  $dataOutput->institutions->institution[0] : null;
            $formatedData = array(
                "typeName" => 'report',
                "title" => $dataOutput->{"report-title"},
                "volume" => $dataOutput->{"volume"},
                "pages" => $dataOutput->{"number-of-pages"},
                "institution" => implode(" and ", array_map(function ($institution) {
                    return $institution->{"institution-name"};
                }, isset($dataOutput->{"institutions"}->institution) ? $dataOutput->{"institutions"}->institution : array())),
                "year" => isset($dataOutput->{"date-submitted"}) ? $dataOutput->{"date-submitted"}->year : "",
                "author" => formatAuthors($dataOutput->{"authors"}),
                "url" => $dataOutput->url,
            );
            break;
        case 'working-paper':
            $formatedData = array(
                "typeName" => 'report',
                "title" => $dataOutput->{"title"},
                "volume" => $dataOutput->volume,
                "year" => isset($dataOutput->{"publication-date"}) ? $dataOutput->{"publication-date"}->year : "",
                "month" => isset($dataOutput->{"publication-date"}) ? $dataOutput->{"publication-date"}->month : "",
                "url" => $dataOutput->url,
                "author" => formatAuthors($dataOutput->{"authors"}),
            );
            break;
        case 'manual':
            $formatedData = array(
                "typeName" => 'book',
                "title" => $dataOutput->{"title"},
                "series" => $dataOutput->{"series-title"},
                "volume" => $dataOutput->volume,
                "edition" => $dataOutput->edition,
                "pages" => $dataOutput->{"number-of-pages"},
                "year" => $dataOutput->{"publication-year"},
                //"address" => isset($dataOutput->{"publication-location"}) ? ($dataOutput->{"publication-location"}->city . ", " . $dataOutput->{"publication-location"}->country->value) : "",
                "publisher" => $dataOutput->publisher,
                "url" => $dataOutput->url,
                "author" => formatAuthors($dataOutput->{"authors"}),
            );
            break;
        case 'online-resource':
            $date = $dataOutput->{"creation-date"};
            $formatedData = array(
                "typeName" => 'online',
                "title" => $dataOutput->{"title"},
                "year" => isset($dataOutput->{"creation-date"}) ? $dataOutput->{"creation-date"}->year : "",
                "month" => isset($dataOutput->{"creation-date"}) ? $dataOutput->{"creation-date"}->month : "",
                "url" => $dataOutput->url,
                "author" => formatAuthors($dataOutput->{"authors"}),
            );
            break;
        case 'website':
            $date = $dataOutput->{"launch-date"};
            $formatedData = array(
                "typeName" => 'online',
                "title" => $dataOutput->{"title"},
                "description" => $dataOutput->description,
                "year" => isset($dataOutput->{"launch-date"}) ? $dataOutput->{"launch-date"}->year : "",
                "month" => isset($dataOutput->{"launch-date"}) ? $dataOutput->{"launch-date"}->month : "",
                "url" => $dataOutput->url,
                "author" => formatAuthors($dataOutput->{"authors"}),
            );
            break;
        case 'conference-paper':
            $date = $dataOutput->{"conference-date"};
            $location = $dataOutput->{"conference-location"};
            $formatedData = array(
                "typeName" => 'inproceedings',
                "title" => $dataOutput->{"paper-title"},
                "booktitle" => addslashes($dataOutput->{"proceedings-title"}),
                "year" => isset($dataOutput->{"conference-date"}) ? $dataOutput->{"conference-date"}->year : "",
                "pages" => generatePageRange($dataOutput, "page-range-from", "page-range-to"),
                "publisher" => $dataOutput->{"proceedings-publisher"},
                "author" => formatAuthors($dataOutput->{"authors"}),
            );
            if (isset($dataOutput->{"conference-name"})) {
                $data["maintitle"] = $dataOutput->{"conference-name"};
            }
            break;
        case 'conference-abstract':
            $date = $dataOutput->{"publication-date"};
            $location = $dataOutput->{"conference-location"};
            $formatedData = array(
                "typeName" => 'article',
                "title" => $dataOutput->{"article-title"},
                "journal" => $dataOutput->{"conference-name"},
                "volume" => $dataOutput->{"volume"},
                "number" => $dataOutput->{"issue"},
                "pages" => generatePageRange($dataOutput, "page-range-from", "page-range-to"),
                "year" => isset($dataOutput->{"publication-date"}) ? $dataOutput->{"publication-date"}->year : "",
                "author" => formatAuthors($dataOutput->{"authors"}),
            );
            break;
        case 'conference-poster':
            $date = $dataOutput->{"conference-date"};
            $formatedData = array(
                "typeName" => 'inproceedings',
                "title" => $dataOutput->{"title"},
                "booktitle" => $dataOutput->{"conference-name"},
                "year" => isset($dataOutput->{"conference-date"}) ? $dataOutput->{"conference-date"}->year : "",
                "author" => formatAuthors($dataOutput->{"authors"}),
            );
            break;
        case 'exhibition-catalogue':
            $formatedData = array(
                "typeName" => 'book',
                "title" => $dataOutput->{"title"},
                "pages" => $dataOutput->{"number-of-pages"},
                "year" => $dataOutput->{"publication-year"},
                "publisher" => addslashes($dataOutput->{"gallery-or-publisher"}),
                "author" => formatAuthors($dataOutput->{"authors"}),
            );
            break;
        case 'preface-postface':
            $formatedData = array(
                "typeName" => 'incollection',
                "title" => addslashes($dataOutput->{"preface-postface-title"}),
                "booktitle" => addslashes($dataOutput->{"book-title"}),
                "volume" => $dataOutput->{"book-volume"},
                "edition" => $dataOutput->{"book-edition"},
                "pages" => generatePageRange($dataOutput, "preface-postface-page-range-from", "preface-postface-page-range-to"),
                "refereed" => ($dataOutput->refereed ? "true" : "false"),
                "year" => $dataOutput->{"publication-year"},
                "address" => isset($dataOutput->{"publication-location"}) ? $dataOutput->{"publication-location"}->city . ", " . $dataOutput->{"publication-location"}->country->value : "",
                "publisher" => addslashes($dataOutput->{"book-publisher"}),
                "url" => $dataOutput->url,
                "author" => formatAuthors($dataOutput->{"authors"}),
                "editor" => formatAuthors($dataOutput->{"editors"}),
            );
            break;
        case 'preprint':
            $date = $dataOutput->{"date-submitted"};
            $location = $dataOutput->{"submission-location"};
            $formatedData = array(
                "typeName" => 'article',
                "title" => $dataOutput->title,
                "volume" => $dataOutput->volume,
                "journal" => $dataOutput->journal,
                "address" => isset($dataOutput->{"submission-location"}) ? $dataOutput->{"submission-location"}->city . ", " . $dataOutput->{"submission-location"}->country->value : "",
                "year" => isset($dataOutput->{"date-submitted"}) ? $dataOutput->{"date-submitted"}->year : "",
                "url" => $dataOutput->url,
                "author" => formatAuthors($dataOutput->{"authors"}),
            );
            break;
        case 'artistic-exhibition':
            $date = $dataOutput->{"date-of-first-performance"};
            $institution = isset($dataOutput->institutions) ?  $dataOutput->institutions->institution[0] : null;
            $formatedData = array(
                "typeName" => 'misc',
                "title" => $dataOutput->{"the-title-of-work"},
                "year" => isset($date) ? $date->year : "",
                "type" => "Exhibition",
                "institution" => implode(" and ", array_map(function ($institution) {
                    return $institution->{"institution-name"};
                }, isset($dataOutput->{"institutions"}->institution) ? $dataOutput->{"institutions"}->institution : array())),
                "author" => formatAuthors($dataOutput->{"authors"}) . " and " . formatAuthors($dataOutput->{"collaborators"}),
                "venue" => implode(', ', isset($dataOutput->{"venues"}->{"venue"}) ? $dataOutput->{"venues"}->{"venue"} : array()),
            );
            break;
        case 'audio-recording':
            $date = $dataOutput->{"release-date"};
            $author = formatAuthors($dataOutput->{"performers"});
            if ($author == '') {
                $author = $dataOutput->producer;
            }
            $formatedData = array(
                "typeName" => 'music',
                "title" => $dataOutput->{"piece-title"},
                "year" => isset($date) ? $date->year : "",
                "type" => "Audio Recording",
                "booktitle" => $dataOutput->{"album-title"},
                "author" => $author,
                "publisher" => $dataOutput->{"distributor"},
            );
            break;
        case "musical-composition":
            $date = $dataOutput->{"composition-date"};
            $formatedData = array(
                "typeName" => 'music',
                "title" => $dataOutput->{"title"},
                //"pages" => $dataOutput->{"number-of-pages"},
                "year" => isset($date) ? $date->year : "",
                "author" => formatAuthors($dataOutput->{"composers"}),
                "publisher" => $dataOutput->{"publisher"},
            );
            break;
        case "musical-performance":
            $date = $dataOutput->{"date-of-first-performance"};
            $formatedData = array(
                //performance-role
                "typeName" => "music",
                "title" => $dataOutput->{"the-title-of-work"},
                "year" => isset($date) ? $date->year : "",
                "type" => $dataOutput->{"performance-role"}->value,
                // "booktitle" => $dataOutput->{"album-title"},
                "author" => formatAuthors($dataOutput->{"authors"}) . " and " . formatAuthors($dataOutput->{"collaborators"}),
                "venue" => implode(', ', isset($dataOutput->{"venues"}->{"venue"}) ? $dataOutput->{"venues"}->{"venue"} : array()),
            );
            break;
        case "radio-tv-program":
            $date = $dataOutput->{"broadcast-date"};
            $programTitle = isset($dataOutput->{"series-title"}) && isset($dataOutput->{"program-title"})
                ? $dataOutput->{"program-title"} . ': ' . $dataOutput->{"series-title"} : (isset($dataOutput->{"program-title"})
                    ? $dataOutput->{"program-title"} : (isset($dataOutput->{"series-title"})
                        ? $dataOutput->{"series-title"} : ''));
            $formatedData = array(
                //performance-role
                "typeName" => "audio",
                "title" => $dataOutput->{"episode-title"},
                "booktitle" => $programTitle,
                "year" => isset($date) ? $date->year : "",
                "author" => formatAuthors($dataOutput->{"creators"}),
                "publisher" => $dataOutput->{"publisher"},
            );
            break;
        case "short-fiction":
            $date = $dataOutput->{"publication-date"};
            $formatedData = array(
                "typeName" => "book",
                "title" => $dataOutput->{"title"},
                "booktitle" => $dataOutput->{"appeared-in"},
                "year" => isset($date) ? $date->year : "",
                "author" => formatAuthors($dataOutput->{"authors"}),
                "editor" => $dataOutput->{"editors"},
                "volume" => $dataOutput->{"volume"},
                "number" => $dataOutput->{"issue"},
                "publisher" => $dataOutput->{"publisher"},
                "pages" => generatePageRange($dataOutput, "page-range-from", "page-range-to"),

            );
            break;
        case "video-recording":
            $date = $dataOutput->{"release-date"};
            $formatedData = array(
                //performers ???
                "typeName" => "video",
                "title" => $dataOutput->{"title"},
                "series" => $dataOutput->{"series-title"},
                "director" => $dataOutput->{"director"},
                "author" => $dataOutput->{"producer"},
                "type" => "Video",
                "publisher" => $dataOutput->{"distributor"},
                "year" => isset($date) ? $date->year : "",
                // ??? "author" => formatAuthors($dataOutput->{"performers"}),
            );
            break;
        case "visual-artwork":
            $formatedData = array(
                "typeName" => "artwork",
                "title" => $dataOutput->{"title"},
                "author" => formatAuthors($dataOutput->{"artists"}),
                "type" => "Visual Artwork",
            );

            break;
        case "choreography":
            //keyCollaborators
            //principalDancers
            $date = $dataOutput->{"premier-date"};
            $formatedData = array(
                "typeName" => "misc",
                "title" => $dataOutput->{"show-title"},
                "year" => isset($date) ? $date->year : "",
                "bookauthor" =>  $dataOutput->{"composer"},
                "author" => formatAuthors($dataOutput->{"authors"}),
                "organization" => $dataOutput->{"company"},
            );
            break;
        case "curatorial-museum-exhibition":
            //artists
            //datesOfSubsequentExhibitions
            //exhibitionCatalogueTitle
            $date = $dataOutput->{"date"};
            $formatedData = array(
                "typeName" => "misc",
                "title" => $dataOutput->{"exhibition-title"},
                "type" => "Exhibition",
                "year" => isset($date) ? $date->year : "",
                "author" => formatAuthors($dataOutput->{"authors"}),
                "venue" => implode(', ', isset($dataOutput->{"venues"}->{"venue"}) ? $dataOutput->{"venues"}->{"venue"} : array()),
            );
            break;
        case "performance-art":
            //keyCollaborators
            //datesOfSubsequentPerformances
            $date = $dataOutput->{"performance-date"};
            $formatedData = array(
                "typeName" => "misc",
                "year" => isset($date) ? $date->year : "",
                "publisher" => $dataOutput->venue, //?
                "author" => formatAuthors($dataOutput->{"authors"}),
            );
            break;
        case "patent":
            $country = isset($dataOutput->{"country"}) ? $dataOutput->country->value : '';
            $date = $dataOutput->{"date-issued"};
            $formatedData = array(
                //owner
                "typeName" => "patent",
                "title" => $dataOutput->{"patent-title"},
                "year" => isset($date) ? $date->year : "",
                "number" =>  $dataOutput->{"patent-number"},
                "address" => $country,
                "author" => formatAuthors($dataOutput->{"authors"}),
            );
            break;
        case "software":
            $institutions = isset($dataOutput->institutions) ? $dataOutput->institutions : null;
            $date = $dataOutput->{"publication-date"};
            $formatedData = array(
                "typeName" => "software",
                "title" => $dataOutput->{"title"} . " " . $dataOutput->{"description"},
                "version" => $dataOutput->{"version"},
                "year" => isset($date) ? $date->year : "",
                "type" => $dataOutput->{"platform"},
                "author" => formatAuthors($dataOutput->{"authors"}),

                "institution" => implode(' and ', array_map(function ($institution) {
                    return $institution->{"institution-name"};
                }, isset($institutions->institution) ? $institutions->institution : array()))

            );
            break;
        default:
            return null;
    }
    //Adicionar as keywords
    $formatedData["keywords"] =   implode(', ', isset($dataOutput->{"keywords"}->{"keyword"}) ? $dataOutput->{"keywords"}->{"keyword"} : array());
    if ($date == null && isset($dataOutput->{"publication-date"})) {
        $date = $dataOutput->{"publication-date"};
    }
    if ($location == null && isset($dataOutput->{"publication-location"})) {
        $location = $dataOutput->{"publication-location"};
    }
    if ($year == null && isset($dataOutput->{"publication-year"})) {
        $year = $dataOutput->{"publication-year"};
    }
    if (isset($date->year)) {
        $year = $date->year;
    }

    $fullDate = null;
    if (isset($year)) { //Apenas utilizar a data se o ano estiver defenido senão colocar null
        $month = isset($date->month) ? $date->month : '01'; // Por defeito é janeiro, se o mês não for fornecido
        $day = isset($date->day) ? $date->day : '01'; // Por defeito é o primeiro dia, se o dia não for fornecido         
        $fullDate = "$year-$month-$day";
    }

    if (!isset($country)) {
        $country = null;
    }
    if (!isset($city)) {
        $city = null;
    }
    if (isset($location)) {
        $country = isset($location->country) ? $location->country->value : null;
        $city = $location->city;
    }

    //Se o typeName não existir no array que corresponde os tipos do API com os do citacion.js colocar como misc
    if (!isset($formatedData["typeName"])) {
        $formatedData["typeName"] = "misc";
    }
    //Retorna os dados da publicação já preparados para inserir no comando SQL, com o nome do campo na tabela SQL como chave 
    $result = [
        "data" => $fullDate,
        "dados" => $formatedData,
        "pais" =>  $country,
        "cidade" => $city,
        "tipo" => $typeOutput
    ];
    return  $result;
}

$sql = "SELECT nome, ciencia_id from investigadores WHERE id = ?";
$stmt = mysqli_prepare($conn, $sql);
mysqli_stmt_bind_param($stmt, 'i', $id);
$id = $_GET["id"];

mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
$row = mysqli_fetch_assoc($result);
$nome = $row["nome"];
$cienciaId = $row["ciencia_id"];

$sql = "SELECT p.idPublicacao, p.dados, p.data, p.pais, p.cidade, p.tipo
        FROM publicacoes p
        INNER JOIN publicacoes_investigadores pi ON p.idPublicacao = pi.publicacao
        WHERE pi.investigador = ?";

$stmt = mysqli_prepare($conn, $sql);
mysqli_stmt_bind_param($stmt, 'i', $id);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
// Array que irá conter todas as publicações do investigador
$publications = array();
if ($result !== false) {
    while ($row = mysqli_fetch_assoc($result)) {
        // Guardar a row como um array no array publicações com a key sendo o seu id
        $publications[$row["idPublicacao"]] = $row;
    }
}
mysqli_stmt_close($stmt);

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    //Guardar os resultados da publicacoes selecionadas como visíveis, e os não selecionados como não visíveis
    if (isset($_POST["saveChanges"])) {
        // Preparar comando SQL
        $sql = "UPDATE publicacoes SET visivel = ? WHERE idPublicacao = ?";
        $stmt = mysqli_prepare($conn, $sql);

        // Vincular parâmetros
        mysqli_stmt_bind_param($stmt, "is", $visibility, $checkboxId);

        //Obter as os ids de todas as publicações do investigador
        $existingIds = array_keys($publications);

        // Percorrer todas as publicações do investigador
        foreach ($existingIds as $checkboxId) {
            // Verificar se o idCheckbox está presente nos dados POST
            if (isset($_POST["publicacao"][$checkboxId])) {
                // Checkbox está selecionado, definir visivel como 1
                $visibility = 1;
            } else {
                // Checkbox não está selecionado, definir visivel como 0
                $visibility = 0;
            }
            mysqli_stmt_execute($stmt);
        }
        mysqli_stmt_close($stmt);
    }


    //Atualizar os dados da base de dados com o da Ciencia Vitae usando a API
    if (isset($_POST['updateData'])) {
        $validTypes = array(
            //newspapper-article é o tipo de output vindo da API do Ciencia Vitae, o erro ortográfico  é da API
            "journal-article", "journal-issue", "book", "edited-book", "book-chapter", "book-review", "translation", "dissertation", "newspapper-article", "newsletter-article", "encyclopedia-entry", "magazine-article", "dictionary-entry", "report", "working-paper", "manual", "online-resource", "website", "conference-paper", "conference-abstract", "conference-poster", "exhibition-catalogue", "preface-postface", "preprint",
            "artistic-exhibition", "audio-recording", "musical-composition", "musical-performance", "radio-tv-program", "short-fiction", "video-recording", "visual-artwork", "choreography", "curatorial-museum-exhibition", "performance-art",
            "patent", "software"
        );
        //Login e password da API da Ciência Vitae definidos em ../config/credentials.php
        $loginAPI = USERCIENCIA;
        $passwordAPI = PASSWORDCIENCIA;

        $url = "https://qa.cienciavitae.pt/api/v1.1/curriculum/" . $cienciaId . "/output/cached?lang=User%20defined";
        //$url = "https://api.cienciavitae.pt/v1.1/curriculum/" . $cienciaId . "/output/cached?lang=User%20defined";
        
        
        $ch = curl_init();
        $headers = array(
            "Content-Type: application/json",
            "Accept: application/json",
        );
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
        curl_setopt($ch, CURLOPT_USERPWD, "$loginAPI:$passwordAPI");
        $result_curl = curl_exec($ch);
        curl_close($ch);
        $data = json_decode($result_curl);
        if (isset($data->{"output"})) {

            $idPublicAPI = array();
            foreach ($data->{"output"} as $output) {
                //Encontrar o campo que contém os dados da publicação
                foreach ($output as $field => $value) {
                    if ($field !== "output-category" && $field !== "output-type" && !is_null($value)) {
                        $typeOutput = $field;
                        $dataOutput = $value;
                        break;
                    }
                }
                //Se não é um tipo de publicação valído 
                if (!in_array($typeOutput, $validTypes)) {
                    continue;
                }

                //Se foi encontrado a publicação sem ocorrer nenhum erro
                if (!(isset($typeOutput) && isset($dataOutput))) {
                    echo "ERRO: Não foram encontrados os dados da publicação";
                } else {
                    //Encontrar o identificador da publicação , especificamente o source-work-id'
                    $publicId = '';
                    if (isset($dataOutput->identifiers->identifier)) {
                        foreach ($dataOutput->identifiers->identifier as $identifier) {
                            if (isset($identifier->{'identifier-type'}->code) && $identifier->{'identifier-type'}->code === 'source-work-id') {
                                $publicId = $identifier->identifier;
                                break;
                            }
                        }
                    }
                    $result = getPublicationInfo($dataOutput, $typeOutput);
                    if (isset($result)) {
                        $result['dados'] = generatePublicationEntry($publicId, $result['dados']);
                        $result['idPublicacao'] = $publicId;
                        $idPublicAPI[] = $publicId;

                        // Se não existe a publicação associada ao investigador insere
                        if (!isset($publications[$publicId])) {
                            //Insere a publicação e quase exista atualiza-a
                            $queryInsert = "INSERT INTO publicacoes (";
                            $queryInsert .= implode(", ", array_keys($result));
                            $queryInsert .= ") VALUES (";
                            $queryInsert .= implode(", ", array_fill(0, count($result), "?"));
                            $queryInsert .= ") ON DUPLICATE KEY UPDATE ";
                            $queryInsert .= implode(", ", array_map(function ($field) {
                                return "$field = VALUES($field)";
                            }, array_keys($result)));

                            $stmtInsert = mysqli_prepare($conn, $queryInsert);

                            $types = str_repeat('s', count($result));
                            mysqli_stmt_bind_param($stmtInsert, $types, ...array_values($result));

                            //Caso tenha inserido com sucesso a publicação
                            if (mysqli_stmt_execute($stmtInsert)) {
                                mysqli_stmt_close($stmtInsert);

                                //Inserir a relação do investigador e esta publicação
                                $queryInsertInves = "INSERT INTO publicacoes_investigadores (publicacao, investigador) VALUES (?, ?)";
                                $stmtInsertInvest = mysqli_prepare($conn, $queryInsertInves);

                                mysqli_stmt_bind_param($stmtInsertInvest, 'si', $publicId, $id);

                                if (!mysqli_stmt_execute($stmtInsertInvest)) {
                                    echo "Erro ao inserir registo " . $publicId . " em publicacoes_investigadores: " . mysqli_error($conn) . "<br>";
                                }

                                mysqli_stmt_close($stmtInsertInvest);
                            } else {
                                echo "Erro ao inserir registo " . $publicId . " em publicações: " . mysqli_error($conn) . "<br>";
                            }
                        } else if ($publications[$publicId] != $result) {


                            // Supondo que $result é um array associativo contendo seus dados
                            $updateQuery = "UPDATE publicacoes SET ";
                            $updateQuery .= implode(" = ?, ", array_keys($result)) . " = ?";
                            $updateQuery .= " WHERE idPublicacao = ?"; // Assuming idPublicacao is the column name

                            $stmt = mysqli_prepare($conn, $updateQuery);

                            // Supondo que $result contém seus valores na mesma ordem das chaves
                            $bindValues = array_values($result);
                            // Definir tipos de parâmetro para o bind (todos os strings seguidos de uma string)
                            $bindTypes = str_repeat("s", count($bindValues)) . "s";
                            $bindValues[] = $publicId;

                            // Criar um array com referências para os valores a serem vinculados
                            $bindParams = array();
                            $bindParams[] = &$bindTypes;
                            foreach ($bindValues as $key => $value) {
                                $bindParams[] = &$bindValues[$key];
                            }

                            mysqli_stmt_bind_param($stmt, $bindTypes, ...$bindValues);
                            if (!mysqli_stmt_execute($stmt)) {
                                echo "Erro ao atualizar registro " . $publicId . " em publicacoes " . mysqli_error($conn) . "<br>";
                            }
                            mysqli_stmt_close($stmt);
                        }
                        unset($result);
                        //print_r($result);
                    } else {
                        echo "$typeOutput não é um tipo de publicação reconhecido<br>";
                    }
                }
            }
        }

        // Identificar IDs do array com todos os IDS actuais da API e os da BD
        $missingKeys  = array_diff(array_keys($publications), $idPublicAPI);
        $idsToDelete = array_intersect($missingKeys, array_keys($publications));

        // Se houver IDs para excluir, realizar uma operação de eliminar
        if (!empty($idsToDelete)) {
            // Criar uma lista separada por vírgulas de espaços reservados, os ?, para os IDs 
            $placeholders = str_repeat('?,', count($idsToDelete) - 1) . '?';

            // Preparar o comando de DELETE
            $deleteQuery = "DELETE FROM publicacoes_investigadores WHERE publicacao IN ($placeholders) and investigador = $id";
            $deleteStatement = mysqli_prepare($conn, $deleteQuery);

            if ($deleteStatement) {
                // Vincular parâmetros e executar o comando
                $types = str_repeat('s', count($idsToDelete));
                mysqli_stmt_bind_param($deleteStatement, $types, ...$idsToDelete);

                if (mysqli_stmt_execute($deleteStatement)) {
                    // echo "Registos eliminados com sucesso.<br>";
                } else {
                    // echo "Erro ao eliminar registos: " . mysqli_error($conn) . "<br>";
                }

                mysqli_stmt_close($deleteStatement);
            } else {
                // echo "Erro ao preparar o comando de eliminação: " . mysqli_error($conn) . "<br>";
            }
        }

        // Correr o comnado que eliminar registos da tabela publicacoes que não têm entrada correspondente em publicacoes_investigadores
        $deleteQuery = "DELETE FROM publicacoes WHERE idPublicacao NOT IN (SELECT publicacao FROM publicacoes_investigadores)";
        $deleteResult = mysqli_query($conn, $deleteQuery);
        if ($deleteResult) {
            $numRowsAffected = mysqli_affected_rows($conn);
            if ($numRowsAffected > 0) {
                //echo "Registos eliminados com sucesso na tabela publicacoes. Foram eliminados $numRowsAffected registos.<br>";
            }
        } else {
            // echo "Erro ao eliminar registos da tabela publicacoes: " . mysqli_error($conn) . "<br>";
        }
    }
}

// Consulta para buscar todas as publicações do investigador
$sql = "SELECT p.idPublicacao, p.dados, p.visivel, p.tipo, p.data
        FROM publicacoes p
        INNER JOIN publicacoes_investigadores pi ON p.idPublicacao = pi.publicacao
        WHERE pi.investigador = ?";

// Verificar se o formulário de pesquisa foi submetido
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['searchQuery'])) {
    // Adicionar a cláusula WHERE à consulta SQL para filtrar publicações com base na pesquisa
    $searchQuery = "%" . $_POST['searchQuery'] . "%";
    $sql .= " AND p.dados LIKE ?";
    mysqli_stmt_bind_param($stmt, "is", $id, $searchQuery);
}

$stmt = mysqli_prepare($conn, $sql);
mysqli_stmt_bind_param($stmt, "i", $id);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);

// Preencher o array $publicacoesInfo diretamente com os resultados da consulta
$publicacoesInfo = mysqli_fetch_all($result, MYSQLI_ASSOC);

// Fechar a conexão com o banco de dados
mysqli_stmt_close($stmt);
mysqli_close($conn);

?>




<style>
    .container {
        max-width: 550px;
    }

    label {
        overflow: auto;
        max-width: 100%;
    }


    .has-error label,
    .has-error input,
    .has-error textarea {
        color: red;
        border-color: red;
    }

    .list-unstyled li {
        font-size: 13px;
        padding: 4px 0 0;
        color: red;
    }


    textarea {
        min-height: 100px;
    }
</style>


<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</link>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script>
<script src="../assets/js/citation-js-0.6.8.js"></script>

<div class="container-xl mt-5">
    <div class="card">
        <h5 class="card-header text-center">Selecionar Publicações do Investigador <?php echo $nome ?></h5>
        <div class="card-body">

            <!-- Botão de Atualizar Dados com a API -->
            <form id="updateForm" method="post">
                <button type="submit" name="updateData" class="btn btn-warning btn-block">Atualizar Dados</button>
            </form>

            <div style="text-align: center;">
            <input type="text" class="form-control" id="searchInput" placeholder="Pesquisar Publicação" style="width: 300px; height: 40px; display: inline-block;">
            </div>

            <form method="post">
                <div class="mb-3" id="publicacoes">
                </div>
                <form id="searchForm" class="mb-3">
                        <div class="form-group">
                        </div>
                 </form>


                <div class="form-group">
                    <button type="submit" name="saveChanges" class="btn btn-primary btn-block">Gravar</button>
                </div>

                <div class="form-group">
                    <button type="button" onclick="window.location.href = 'index.php'" class="btn btn-danger btn-block">Cancelar</button>
                </div>
            </form>
        </div>
    </div>
</div>



<script>
    const Cite = require('citation-js');

    function getAPA(data) {
        // Lógica de processamento do "citacion.js"
        return new Cite(data).format('bibliography', {
            format: 'html',
            template: 'apa',
            lang: 'en-US'
        });;
    }

    var publicacoesInfo = <?php echo json_encode($publicacoesInfo); ?>;

    var publicacoesDiv = document.getElementById('publicacoes');

    // Criar um objeto para agrupar as publicações por "tipo"
    var publicationsByTipo = {};

    // Iterar pelas publicações e agrupá-las por "tipo"
    for (var i = 0; i < publicacoesInfo.length; i++) {
        var publicacao = publicacoesInfo[i];
        var tipo = publicacao.tipo;

        if (!publicationsByTipo[tipo]) {
            publicationsByTipo[tipo] = [];
        }

        publicationsByTipo[tipo].push(publicacao);
    }

    // Iterar pelas publicações agrupadas e exibi-las
    for (var tipo in publicationsByTipo) {
        if (publicationsByTipo.hasOwnProperty(tipo)) {
            // Criar um contentor div para o tipo de publicação
            var tipoContainer = document.createElement('div');
            tipoContainer.classList.add('tipo-publicacao');

            // Criar um cabeçalho para o tipo de publicação
            var tipoHeading = document.createElement('h5');
            tipoHeading.classList.add('mt-4');
            tipoHeading.classList.add('mb-2');
            tipoHeading.textContent = tipo;
            tipoContainer.appendChild(tipoHeading);

            // Iterar pelas publicações ordenadas e exibi-las
            for (var j = 0; j < publicationsByTipo[tipo].length; j++) {
                var publicacao = publicationsByTipo[tipo][j];

                // Criar um contentor div para cada publicação
                var container = document.createElement('div');
                container.classList.add('form-check', 'mb-3');

                // Criar a caixa de seleção
                var checkbox = document.createElement('input');
                checkbox.type = 'checkbox';
                checkbox.name = 'publicacao[' + publicacao.idPublicacao + ']';
                checkbox.value = publicacao.idPublicacao;
                checkbox.checked = publicacao.visivel;
                checkbox.classList.add('form-check-input');

                // Criar um div para o conteúdo
                var contentDiv = document.createElement('div');
                contentDiv.innerHTML = getAPA(publicacao.dados);
                contentDiv.classList.add('form-check-label');

                // Anexar a caixa de seleção e o conteúdo ao contentor
                container.appendChild(checkbox);
                container.appendChild(contentDiv);

                // Anexar o contentor da publicação ao contentor do tipo
                tipoContainer.appendChild(container);
            }

            // Anexar o contentor do tipo ao contentor principal
            publicacoesDiv.appendChild(tipoContainer);
        }
    }


    window.addEventListener('DOMContentLoaded', function() {
        const checkboxes = document.querySelectorAll('input[type="checkbox"]');
        let lastChecked;

        function handleCheck(event) {
            if (event.shiftKey) {
                let start = Array.from(checkboxes).indexOf(this);
                let end = Array.from(checkboxes).indexOf(lastChecked);
                if (start > end) {
                    [start, end] = [end, start];
                }
                checkboxes.forEach((checkbox, index) => {
                    if (index >= start && index <= end) {
                        checkbox.checked = this.checked;
                    }
                });
            }

            lastChecked = this;
        }

        checkboxes.forEach(checkbox => checkbox.addEventListener('click', handleCheck));
    });

  
    $(document).ready(function() {
    // Filtragem feita de acordo com cada letra escrita
    $('#searchInput').on('input', function() {
        filterPublications($(this).val().toLowerCase());
    });

    // Função para filtrar as publicações com base no título
    function filterPublications(input) {
    $('.form-check').each(function() {
        var publicationTitle = $(this).text().toLowerCase(); // Obtém o texto da publicação
        // Verifica se o texto da publicação contém o texto de entrada
        if (publicationTitle.includes(input)) {
            $(this).show(); // Exibe a publicação se corresponder
        } else {
            $(this).hide(); // Oculta a publicação se não corresponder
        }
    });
}


});


document.getElementById('searchForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Impede o envio do formulário
    filterPublications(); // Chama a função de filtragem
});

// Ouve eventos de entrada para atualizar dinamicamente os resultados da pesquisa
document.getElementById('searchInput').addEventListener('input', filterPublications);


</script>