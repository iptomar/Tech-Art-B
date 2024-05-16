<?php
include_once "config/configurations.php";
function ret_dic_en()
{



    /**
     * Dicionario para site em ingles
     * As chaves dos arrays servirao como substituto do id ou classe CSS do objeto
     * [INCOMPLETO!!! VERIFICAR E INTRODUZIR ENTRADAS NESTE DICIONARIO
     * E ACRESCENTAR TRADUCOES DE DADOS DA BD SE POSSIVEL!!]
     */
    $dic_en = array(

        //dates
        "day-name" => array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'),
        "date-of" => " of ",
        "month-name" => array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'),
        //::::::CABEÇALHO PRINCIPAL::::::

        //Imagem com o logotipo da techn&art
        "header-site-logo" => "./assets/images/TechnArt11FundoTrans.png",
        //Drop-down 'Sobre o Techn&Art'
        "about-technart-drop-down" => "About Techn&art",
        "mission-and-goals-option" => "Mission and Goals",
        "research-axes-option" => "Research Axes",
        "org-struct-option" => "Organic Structure",
        "opportunities-option" => "Opportunities",
        "funding-option" => "Funding",
        //Drop-down 'Projetos'
        "projects-tab" => "Projects",
        "ongoing-option" => "Ongoing",
        "finished-option" => "Finished",
        //Drop-down 'Investigadores/as'
        "researchers-drop-down" => "Researchers",
        "integrated-option" => "Integrated",
        "collaborators-option" => "Collaborators",
        "students-option" => "Student Collaborators",
        "admission-option" => "New admissions",
        //Separador 'Noticias'
        "news-tab" => "News",
        //Separador 'Publicacoes'
        "publ-tab" => "Publications",

        //::::::RODAPÉ PRINCIPAL::::::

        //Imagem com o logotipo da techn&art
        "footer-site-logo" => "./assets/images/TechnArt12FundoTrans.png",
        //Etiqueta / texto com parte da morada
        "address-txt-1" => "Contador Farm,",
        //Etiqueta / texto com parte da morada
        "address-txt-2" => "Serra Road",
        //Etiqueta / texto 'Siga-nos',
        "follow-us-txt" => "Follow Us",
        //Divisoria com 'projeto UD ...'
        "project-ud-txt" => "Project UD/05488/2020",
        //Etiqueta / texto com 'Instituto Pol...'
        "ipt-copyright-txt" => "©Polytechnic Institute of Tomar",
        //Etiqueta / texto com 'Todos os direitos reservados'
        "all-rights-reserved-txt" => "All rights reserved",

        //::::::index.php::::::

        //Titulo do 1 slide
        "index-first-slide" => "About TECHN&ART",
        //Breve descricao do 1 slide
        "index-first-slide-desc" => "A research and development centre focussed on the safeguard and enhancement of heritage, both experimental and applied",
        //Titulo do 2 slide
        "index-second-slide" => "Technology and interdisciplinarity in service of Heritage",
        //Breve descricao do 2 slide
        "index-second-slide-desc" => "TECHN&ART brings together researchers from a variety of fields in the Polytechnic University of Tomar, from ICT to the arts, from the social sciences to natural sciences",
        //Titulo do 3 slide
        "index-third-slide-slider" => "Research and development in network",
        //Breve descricao do 3 slide
        "index-third-slide-slider-desc" => "TECHN&ART hosts and leads R&D projects within a broad network of national and international partners, on the frontlines of heritage safeguard and enhancement",
        //botao 'Saiba mais' do slider
        "know-more-btn-txt-slider" => "KNOW MORE",
        //Etiqueta 'Video Institucional'
        "institutional-video-heading" => "INSTITUTIONAL VIDEO",
        //Etiqueta 'Projetos I&D'
        "rd-projects-heading" => "R&D PROJECTS",
        //botao 'Ver Todos'
        "see-all-btn-rd-projects" => "SEE ALL",
        //Etiqueta 'Ultimas noticias'
        "latest-news-heading" => "LATEST NEWS",
        //botao 'Ver todas'
        "see-all-btn-latest-news" => "SEE ALL",

        //::::::sobre.php::::::

        //Titulo 'Sobre o Techn&Art'
        "about-technart-page-heading" => "About TECHN&ART",
        //Subitulo página 'Sobre o Techn&Art'
        "about-technart-page-subtitle" => "The <b>TECHN&ART - Center for Technology, Restoration, and Valorization of the Arts</b> is a research and development unit of the Polytechnic Institute of Tomar. TECHN&ART brings together researchers from multiple disciplinary areas with the mission of developing research strategies and methodologies in the field of <b>Safeguarding and Valorization of Artistic and Cultural Heritage</b> in its various forms of expression. This work is carried out with a sustainable, holistic, and transdisciplinary approach, aiming to connect the present with the past.",
        //Legenda 'Missao e Objetivos'
        "mission-and-goals-caption" => "MISSION AND GOALS",
        //Legenda 'Eixos de Investigacao'
        "research-axes-caption" => "RESEARCH AXES",
        //Legenda 'Estrutra organica'
        "organic-struct-caption" => "ORGANIC STRCUTURE",
        //Legenda 'Oportunidades'
        "opportunities-caption" => "OPPORTUNITIES",
        //botao 'SAIBA MAIS'
        "opportunities-know-more-btn" => "KNOW MORE",

        //::::::missao.php::::::

        //Titulo 'Missao e Objetivos'
        "mission-and-goals-page-heading" => "mission and goals",
        //ponto 1
        "mission-and-goals-page-point-one" => "Techn&Art develops research in the fields of Safeguarding Heritage and Valuing Heritage, both in experimental development and in applied research.",
        //ponto 2
        "mission-and-goals-page-point-two" => "This R&amp;D unit's mission is:",
        //ponto 2, alinea a)
        "mission-and-goals-page-a-txt" => "Contribute to the consolidation of IPT's training programs within the listed scientific domains;",
        //ponto 2, alinea b)
        "mission-and-goals-page-b-txt" => "Contribute to the solid education of students by fostering collaboration between the scientific research work conducted by TECHN&ART researchers.",
        //ponto 2, alinea c)
        "mission-and-goals-page-c-txt" => "Disseminate scientific, technological and artistic culture through the organization of conferences, colloquiums, seminars, exhibitions and cultural sessions;",
        //ponto 2, alinea d)
        "mission-and-goals-page-d-txt" => "Promote the advanced training of human resources, encouraging their constant scientific and cultural development;",
        //ponto 2, alinea e)
        "mission-and-goals-page-e-txt" => "Establish inter-institutional cooperation with national and international entities;",
        //ponto 2, alinea f)
        "mission-and-goals-page-f-txt" => "Effectively use the funding it receives and other available resources;",
        //ponto 2, alinea g)
        "mission-and-goals-page-g-txt" => "Provide services to the community within the scope of its activities.",
        //legenda da imagem
        //LEGENDA DA IMAGEM AQUI

        //::::::eixos.php::::::

        //Título 'Eixos de Investigacao'
        "axes-page-heading" => "research axes",
        //Descricao / texto da pagina 'Eixos de investigacao', logo abaixo do subtitulo
        "axes-page-p1-txt" => "The Center for Technology, Restoration, and Valorization of the Arts develops research strategies and methodologies within the scope of two thematic lines:",
        //alinea a)
        "axes-page-a-txt" => "Safeguard",
        //alinea b)
        "axes-page-b-txt" => "Enhancement of Artistic and Cultural Heritage",
        //paragrafo após o a e b
        "axes-page-p2-txt" => "The thematic line of <b>Safeguarding</b> consists of two lines of action: <b>a1) Conservation and Restoration</b> and <b>a2) Characterization and Contextualization of Heritage</b>:",
        //alinea a1)
        "axes-page-a-one-txt" => "<b>Conservation and Restoration –</b> this research line is based on the study of intervention in the conservation and restoration of movable and integrated artistic heritage. It encompasses discussions related to methodologies, materials, technology, and ethics. This line brings together conservators, restorers, and researchers who directly or indirectly participate in research, development, and intervention projects for the safeguarding of artistic and cultural heritage.",
        // alinea a2)
        "axes-page-a-two-txt" => "<b>Characterization and Contextualization of Heritage</b> - this research line is based on cultural, archaeological, historical, artistic, literary studies, as well as physical, chemical, and biological characterization of materials and their alteration and compatibility in terms of chemical and structural preservation. It considers the origin environment and preservation of both existing supports and new materials to be applied. This line brings together researchers from various backgrounds who study, contextualize, and characterize material, immaterial, and natural heritage.",
        //parágrafo após o a1 e a2 antes do b1 e b2
        "axes-page-p3-txt" => "The thematic line of <b>Valorization of Artistic and Cultural Heritage</b> encompasses the lines of action: <b>b1) Didactics, Technology, and Communication</b> and <b>b2) Design and Innovation:</b>",
        //alinea b1)
        "axes-page-b-one-txt" => "<b>Didactics, Technology, and Communication</b> - This research line focuses on the study of education, awareness, and dissemination of cultural and artistic heritage and its preservation at different levels. Within the framework of didactics, the goal is to achieve a symbiosis between heritage, heritage interpretation, and tourism in a sustainable manner. The aim is to provide active and integrated learning experiences through the interpretation of cultural heritage (both tangible and intangible) with high scientific, educational, heritage, and tourism value. Heritage management from the perspective of enjoyment will provide insights into contemporary social and cultural dynamics. Thus, this research line can be integrated into the interaction between contexts that promote learning through the exploration of didactic, technological, and communication connections. These methodologies and strategies include e-learning, mobile learning, learning objects, libraries and repositories of digital content, and gamification. It also encompasses immersive environments, augmented reality, virtual reality, information systems, multimedia, hypermedia, and apps. This line of action brings together researchers in the fields of cultural tourism, documentary film and video, design, and computer science.",
        //alinea b2)
        "axes-page-b-two-txt" => "<b>Design and Innovation</b> - This research line focuses on the creative component, addressing the aesthetic, practical, and symbolic functions of products or projects, with a commitment to society and its environment in a sustainable, inclusive, and innovative way. This line considers technological, social, economic, and cultural aspects, working with form and function, both in communication and product design, in accordance with the material and cultural needs of society. It also encompasses forms of artistic and cultural expression, both tangible and intangible, aiming to preserve memory as encapsulated in various manifestations and decode or reinterpret heritage in light of contemporary understandings, concepts, and languages.",
        //Texto do fundo da página
        "bottom-text" => "These lines of action complement and intertwine so that the whole mission of TECHN&ART is coherent and takes advantage of the aim of transferring the knowledge, skills and experiences of all the researchers and collaborators of our centre.",

        //::::::estrutura.php::::::

        //Título 'Estrutura Organica'
        "org-struct-page-heading" => "organic structure",
        //Descricao / texto da pagina 'Estrutura Organica', logo abaixo do subtitulo
        "org-struct-page-description" => "Techn&Art's activity is supported by the following governing, management and administration bodies:",
        //Etiqueta 'Diretor'
        "org-struct-page-director-tag" => "Director",
        "director" => "<a href='#'>Célio Gonçalo Marques</a>, Information and Communication Technologies",
        //Etiqueta 'Diretor adjunto'
        "org-struct-page-deputy-director-tag" => "Deputy Director",
        "deputy-director" => "<a href='#'>Hermínia Maria Pimenta Ferreira Sol</a>, Literature",
        //Etiqueta 'secretarios administrativos'
        "org-struct-page-executive-secretary-tag" => "Executive Secretary ",
        "executive-secretary" => "Hirondina Alves São Pedro",
        //Etiqueta 'Conselho diretivo'
        "org-struct-page-board-tag" => "Board",
        "board-composed" => "Comprised of the Director, the Deputy Director and by:",
        "board-member1" => "<a href='#'>Ricardo Pereira Triães</a>, Conservation and Restoration",
        "board-member2" => "<a href='#'>Eunice Ferreira Ramos Lopes</a>, Tourism",
        "board-member3" => "<a href='#'>Regina Aparecida Delfino</a>, Graphic Arts",
        "board-member4" => "<a href='#'>Marta Margarida S. Dionísio</a>, Languages",
        "board-member5" => "<a href='#'>Ana Cláudia Pires da Silva</a>, Management",
        //Etiqueta 'Conselho cinetifico'
        "org-struct-page-scinetific-conucil-tag" => "Scientific Council",
        "all-integrated-members" => "Composed of all integrated members.",
        //Etiqueta 'Conselho consultivo'
        "org-struct-page-advisory-council-tag" => "Advisory Council",
        //Elementos integrantes do conselho consultivo
        "advisory-council-one" => "Ana María Calvo Manuel, Faculty of Fine Arts of Completense University of Madrid, Spain.",
        "advisory-council-two" => "Chao Gejin, Institute of Oral Tradition of the Chinese Academy of Social Sciences.",
        "advisory-council-three" => "José Julio García Arranz, University of Extremadura, Spain.",
        "advisory-council-four" => "Laurent Tissot, University of Neuchântel, Switzerland.",
        "advisory-council-five" => "Maria Filomena Guerra, Panthéon Sorbonne University, Nanterre, France.",
        "advisory-council-six" => "Zoltán Somhegyi, Károli Gáspár University, Budapest, Hungary.",

        //::::::oportunidades.php::::::

        //Titulo 'Oportunidades'
        "opport-page-heading" => "opportunities",
        //Subtitulo
        "opport-page-subtitle" => "caption",

        //::::::oportunidade.php::::::
        "opport-page-file" => "Files",

        //::::::projetos_em_curso.php::::::

        //Titulo 'Projetos'
        "projects-ongoing-page-heading" => "Ongoing Projects",
        //Descricao pagina 'Projetos'
        "projects-ongoing-page-description" => "",

        //::::::projetos_concluidos.php::::::

        //Titulo 'Projetos'
        "projects-finished-page-heading" => "Finished Projects",
        //Descricao pagina 'Projetos'
        "projects-finished-page-description" => "",

        //::::::projeto.php::::::

        //Classe css para todos os botoes 'Sobre o projeto'
        "about-project-btn-class" => "about the project",
        //Classe css para todos os titulos de separadores 'Sobre'
        "about-project-tab-title-class" => "About the project",
        //Subtitulo separador 'sobre o projeto'
        "about-project-tab-subtitle-class" => "Subtitle",
        //Etiqueta de referencia do projeto
        "about-project-tab-reference-tag" => "Reference: ",
        //Etiqueta de area preferida do projeto
        "about-project-tab-main-research-tag" => "Main research axis: ",
        //Etiqueta de financiamento do projeto
        "about-project-tab-financing-tag" => "Financing: ",
        //Etiqueta de escopo do projeto
        "about-project-tab-scope-tag" => "Scope: ",
        //Classe css para todos os botoes 'Equipa e Intervenientes'
        "team-steakholders-btn-class" => "team and steakholders",
        //Classe css para todos os botoes 'Equipa e Intervenientes'
        "team-steakholders-tab-title-class" => "Team and steakholders",
        //Subtitulo separador 'equipa e intervenientes'
        "team-steakholders-tab-subtitle-class" => "Subtitle",
        //

        //::::::integrados.php/colaboradores.php/alunos.php::::::

        //Titulo 'Investigadores/as Integrados/as'
        "integrated-researchers-page-heading" => "Integrated Researchers",
        //Descricao de 'Investigadores/as Integrados/as'
        "integrated-researchers-page-heading-desc" => "",
        //Titulo 'Investigadores/as Colaboradores/as'
        "colaborative-researchers-page-heading" => "Collaborative Researchers",
        //Descricao de 'Investigadores/as Integrados/as'
        "colaborative-researchers-page-heading-desc" => "",
        //Titulo 'Investigadores/as Alunos/as'
        "student-researchers-page-heading" => "Student Collaborators",
        //Descricao de 'Investigadores/as Alunos/as'
        "student-researchers-page-heading-desc" => "",

        //::::::integrado.php/colaborador.php/aluno.php:::::

        //Classe css para todos os botoes 'Sobre'
        "about-btn-class" => "about",
        //Classe css para todos os titulos de separadores 'Sobre'
        "about-tab-title-class" => "About",
        //Classe css para todos os botoes 'areas de interesse'
        "areas-btn-class" => "areas of interest",
        //Classe css para todos os titulos de separadores 'areas de interesse'
        "areas-tab-title-class" => "Areas of interest",
        //Classe css para todos os botoes 'publicacoes'
        "publications-btn-class" => "publications",
        //Classe css para todos os titulos de separadores 'publicacoes'
        "publications-tab-title-class" => "Publications",
        //Classe css para todos os botoes 'projetos'
        "projects-btn-class" => "projects",
        //Classe css para todos os titulos de separadores 'projetos'
        "projects-tab-title-class" => "Projects",
        //Texto 'Ligacoes Externas'
        "ext-links" => "External links",

        //::::::noticias.php::::::

        //Titulo pagina 'Noticias'
        "news-page-heading" => "News",
        //Descricao pagina noticias
        "news-page-heading-desc" => "",

        //::::::oportunidades.php::::::

        //Titulo pagina 'Oportunidades'
        "opportunities-page-heading" => "Opportunities",
        //Descricao pagina Oportunidades
        "opportunities-page-heading-desc" => "",

        //::::::publicacoes.php

        //Etiqueta 'Publicacoes'

        "publications-page-heading" => "Publications",
        //Texto 'Ano Desconhecido'
        "year-unknown" => "Unknown",

        //:::::novasadimssoes.php
        "new-admissions-title" => "New admissions",
        "new-admissions-p1" => "The admission of new members to the TECHN&ART research team, integrated or colaborators, is processed through a proposal to the scientific board. The candidate should fill the form with the necessary information and documentation.",
        "new-admissions-p2" => " Admission will require that the candidate be proposed by an integrated member of TECHN&ART, with the letter of recommendation required in the form serving this purpose.",
        "new-admissions-regulations" => "The candidate should also read the TECHN&ART",
        "new-admissions-regulations-link" => "general regulations document.",
        "new-admissions-regulations-fill" => "Fill out Form",

        //:::admiissao.php
        //Título
        "admission-title" => "Integration form | TECHN&ART",
        //Mensagem informação após o título
        "admission-msg-1" => "Dear researcher,",
        "admission-msg-2" => "Thank you very much for your interest in our R&D unit - TECHN&ART. So that your proposal may proceed to the consideration of the scientific board, it is necessary that you fill in this form.",
        "admission-msg-3" => "If any questions arise, do not hesitate to contact our secretariat, at",
        //Placeholder e Erro dos Inputs
        "admission-placeholder" => "Enter your answer",
        "admission-error" => "Please enter a valid value",
        //Etiquetas dos campos de input do formulário
        "admission-name" => "Full name",
        "admission-name-prof" => "Professional Name",
        "admission-cienciaid" => "Ciência ID",
        "admission-orcid" => "ORCID",
        "admission-email" => "Email address",
        "admission-cellphone" => "Cellphone number",
        "admission-academic-qualifications" => "Academic Qualifications",
        "admission-year-conclusion" => "Year of conclusion of the academic qualifications",
        "admission-field-expertise" => "Field of expertise of the academic qualifications",
        "admission-main-research-areas" => "Main research areas",
        "admission-institucional-affliation" => "Institucional affiliation (start date and end date, if applicable [dd/mm/yyyy)]",
        "admission-percentage-dedication-tech" => "Percentage of dedication to TECHN&ART",
        "admission-member-another" => "Are you a member of another research and development centre?",
        "admission-member-yes" => "Yes",
        "admission-member-no" => "No",
        "admission-another-centre-info" => "If YES, which centre, in which category and with what percentage of dedication?",
        "admission-biography" => "Short researcher biography (1-2 paragraphs) in English",
        //Etiquetas dos campos de ficheiros
        "admission-motivation" => "Motivation Letter",
        "admission-recommendation" => "Recommendation Letter of the proponent TECHN&ART researcher",
        "admission-cv" => "Curriculum Vitae",
        "admission-photo" => "Researcher Photo",
        //Botão Submeter
        "admission-submit" => "Submit",
        "admission-cancel" => "Cancel",
        //Mensagens de Submissão
        "admission-file-size-error" => "ERROR: File size exceeds the maximum limit of " . MAX_FILE_SIZE . "MB",
        "admission-required-error" => "ERROR: Failed to retrieve data from the fields",
        "admission-send-error" => "Database ERROR: Please try again later",
        "admission-email-exists" => "The email entered already exists. Please enter another one.",
        "admission-successful" => "The form was successfully submitted",

        //::::::financiamento.php::::::
        "funding-title" => "Funding",
        "funding-p1" => "Funding allocated to the Research Center for Technology, Restoration, and Valorization of Arts (TECHN&ART)",
        "funding-table1-project" => "Project",
        "funding-table1-project-name" => "R&D Unit <br>Center for Technology, Restoration, and Valorization of Arts (TECHN&ART)",
        "funding-table1-investigator" => "Investigator/Coordinator",
        "funding-table1-promoter" => "Promoter",
        "funding-table1-date-celebration" => "Date of celebration/Acceptance Term",
        "funding-table1-execution-period" => "Execution period",
        "funding-table1-start-date" => "Start date",
        "funding-table1-end-date" => "End date",
        "funding-table1-total-investment" => "Total Investment",
        "funding-table1-funding" => "Funding",
        "funding-p2" => "The overall funding of the research center corresponds to the sum of two components:",
        "funding-title-2" => "Base Funding",
        "funding-title-3" => "Programmatic Funding",
        "funding-tables-universal-code" => "Universal Code",
        "funding-tables-funding" => "Funding",
        "funding-tables-execution-period" => "Execution period",

        //:::::: copyright.php :::::::
        "copyright-title" => "Copyright",
        "copyright-p1" => "Website developed as part of the Final Project course by:",
        "copyright-design" => "Design",
        "copyright-advisor" => "Advisor",
        "copyright-students" => "Students",
    );

    return $dic_en;
}
