-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2023 at 11:52 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `technart`
--
CREATE DATABASE IF NOT EXISTS `technart`;
USE `technart`;

-- --------------------------------------------------------

--
-- Table structure for table `administradores`
--

CREATE TABLE `administradores` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `administradores`
--

INSERT INTO `administradores` (`id`, `nome`, `email`, `password`) VALUES
(1, 'Admin_teste', 'admin@admin.pt', '$2y$10$h3fC3yKN7rm9CENS4gA5EOPsywIUYeGpuecP7qf56/2u8xlW018Le'),
(7, 'Admin2', 'admin2@admin.com', '$2y$10$bH.1jT89ydQAU8UFVwKQ..UOOw6deHjNPY5v9UM8y1szBq5M4GAae'),
(8, 'test', 'test@admin.pt', '$2y$10$NaBD2rVVTDfvDf4VVA0pleNFMH2rRgMSfDO1JPqOIAyS0uNBAfLzC');

-- --------------------------------------------------------

--
-- Table structure for table `admissoes`
--

CREATE TABLE `admissoes` (
  `id` int(11) NOT NULL,
  `nome_completo` varchar(255) NOT NULL,
  `nome_profissional` varchar(255) NOT NULL,
  `ciencia_id` varchar(100) NOT NULL,
  `orcid` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `grau_academico` varchar(255) NOT NULL,
  `ano_conclusao_academico` varchar(255) NOT NULL,
  `area_academico` varchar(255) NOT NULL,
  `area_investigacao` varchar(255) NOT NULL,
  `instituicao_vinculo` varchar(255) NOT NULL,
  `percentagem_dedicacao` varchar(255) NOT NULL,
  `pertencer_outro` tinyint(1) NOT NULL,
  `outro_texto` text,
  `biografia` text NOT NULL,
  `ficheiro_motivacao` varchar(255) NOT NULL,
  `ficheiro_recomendacao` varchar(255) NOT NULL,
  `ficheiro_cv` varchar(255) NOT NULL,
  `ficheiro_fotografia` varchar(255) NOT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admissoes`
--

INSERT INTO `admissoes` (`id`, `nome_completo`, `nome_profissional`, `ciencia_id`, `orcid`, `email`, `telefone`, `grau_academico`, `ano_conclusao_academico`, `area_academico`, `area_investigacao`, `instituicao_vinculo`, `percentagem_dedicacao`, `pertencer_outro`, `outro_texto`, `biografia`, `ficheiro_motivacao`, `ficheiro_recomendacao`, `ficheiro_cv`, `ficheiro_fotografia`, `data_criacao`) VALUES
(13, 'BogusOITO FCCN', 'FCCN, BogusOITO', 'C715-1E14-0978', 'https://orcid.org/0000-0003-2433-0883', 'bogus_test@email.pt', '999999999', 'Grau', '2023', 'Artes', 'Ciencia', 'Instituição', 'Percentagem ', 1, '%', 'Curta biografia de investigador', 'motivacao1695803191.pdf', 'recomendacao1695803191.pdf', 'cv1695803191.pdf', 'fotografia1695803191.jpg', '2023-10-16 18:22:38');

-- --------------------------------------------------------

--
-- Table structure for table `investigadores`
--

CREATE TABLE `investigadores` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `ciencia_id` varchar(100) NOT NULL,
  `sobre` mediumtext NOT NULL,
  `sobre_en` mediumtext NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `fotografia` varchar(100) NOT NULL,
  `areasdeinteresse` mediumtext NOT NULL,
  `areasdeinteresse_en` mediumtext NOT NULL,
  `orcid` varchar(255) NOT NULL,
  `scholar` varchar(255) NOT NULL,
  `research_gate` varchar(255) NOT NULL,
  `scopus_id` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `ultimologin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `investigadores`
--

INSERT INTO `investigadores` (`id`, `nome`, `email`, `ciencia_id`, `sobre`, `sobre_en`, `tipo`, `fotografia`, `areasdeinteresse`, `areasdeinteresse_en`, `orcid`, `scholar`, `research_gate`, `scopus_id`, `password`, `ultimologin`) VALUES
(11, 'Joana', 'R.micaela@live.com.pt', '0C1F-9648-2A48', 'miniin inininii ununun ininini', '', 'Integrado', 'FotoRapariga.png', 'xcvbnmuexrcfvgbhnjmkrxrcvgbhnjm', '', 'https://noticias.uc.pt/artigos/estudo-da-universidade-de-coimbra-aponta-desigualdades-sociais-no-acesso-a-ciclovias-e-sistema-de-bicicletas-partilhadas-de/', 'https://www.uc.pt/estudantes', '', '', '$2y$10$2SLVhIPbYFAyoczEuL4vUeoJKE5S/um4Qy8fs1lc2tu9Yj7p9/uRm', NULL),
(12, 'Berto', 'berto_bertinho@gmail.com', '2A13-632C-D743', 'a', '', 'Integrado', '480006581462697f48b6ff44be2ea3d141def7edr1-334-441v2_uhq.jpg', '', '', '', '', '', '', '', NULL),
(19, 'Marta', 'marta@hotmail.com', '2A13-632C-D743', 'nao', '', 'Aluno', '64ae620054719_55918.jpg', 'Ciências da natureza', '', 'https://noticias.uc.pt/artigos/estudo-da-universidade-de-coimbra-aponta-desigualdades-sociais-no-acesso-a-ciclovias-e-sistema-de-bicicletas-partilhadas-de/', 'https://www.uc.pt/estudantes', '', '', '$2y$10$vJmmYnaGTRcHw7X.bLYC1e9GQC5wG4as1ikXUgaZYP592x0n46D7S', NULL),
(20, 'Bogus Oito', 'bogusoito@cienciaid.com', 'C715-1E14-0978', 'ewf', '', 'Colaborador', '6528461fca81a_depositphotos_10962027.jpg', 'efw', '', '0000-0003-2433-0883', '', '', '', '$2y$10$F.DlN/IiCga6p7TwHvrtMuquSs/zSoctKzSiZ9dW0qqx76cpeCR.G', NULL),
(21, 'João Mendes Moreira', 'jmm.fccn2018@gmail.com', 'AF1B-8D21-A7AF', '123', '', 'Colaborador', '6528463fcd40c_Valton-Pessoa-868x1300.jpg', '213', '', '0000-0002-6504-2987', '', '', '', '$2y$10$kwh7wopOVmpL63xfEaoa6.zcfq9vTk3.DJp0ZbEgk3Ei1AzQrulwu', NULL),
(22, 'João', 'joao@test.test', '1019-2EC9-876A', 'dw', '', 'Colaborador', '65284635052d6_istockphoto-1029759424-170667a.jpg', 'wqd', '', '0000-0003-2433-0883', '', '', '', '$2y$10$j5FjnHPoVZfSnUmqLIFY..M4kq.MgCmvXCx3gHciTbag/2Un82g9K', NULL),
(25, 'Carolina Santos', 'c.santos@ipt.pt', '', '', '', 'Externo', '652e5eb59976f_joana-bento-rodrigues.jpg', '', '', '', '', '', '', '$2y$10$R3vWRFOS4G4QRMOTugChBuqECYujjf5T6weWqjMBOJOlcw16ox8lu', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `investigadores_projetos`
--

CREATE TABLE `investigadores_projetos` (
  `investigadores_id` int(11) NOT NULL,
  `projetos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `investigadores_projetos`
--

INSERT INTO `investigadores_projetos` (`investigadores_id`, `projetos_id`) VALUES
(11, 20),
(11, 23),
(11, 24),
(11, 27),
(12, 20),
(12, 24),
(12, 25),
(12, 26),
(19, 20),
(19, 21),
(19, 26),
(19, 27),
(20, 20),
(21, 20),
(22, 20),
(25, 20);

-- --------------------------------------------------------

--
-- Table structure for table `noticias`
--

CREATE TABLE `noticias` (
  `id` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `titulo_en` varchar(100) NOT NULL,
  `conteudo` mediumtext NOT NULL,
  `conteudo_en` mediumtext NOT NULL,
  `imagem` varchar(100) NOT NULL,
  `data` date NOT NULL,
  `ultimo_editor` int(11) DEFAULT NULL,
  `timestamp_editado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `noticias`
--

INSERT INTO `noticias` (`id`, `titulo`, `titulo_en`, `conteudo`, `conteudo_en`, `imagem`, `data`, `ultimo_editor`, `timestamp_editado`) VALUES
(1, 'Visita do Prof. Dr. Silviu Marian Miloiu, Vice-Reitor da Valahia Targoviste University na Roménia', '', '<p>O TECHN&amp;ART recebeu a visita do Prof. Dr. Silviu Marian Miloiu, Vice-Reitor da Valahia Targoviste University na Roménia. A visita realizou-se no seguimento da reunião transnacional no âmbito da KreativEU, Knowledge and Creativity European University, liderada pelo Instituto Politécnico de Tomar</p>', '', '310055055_584688733449528_4008002950286842705_n.jpg', '2022-03-10', 1, '2023-10-20 12:14:14'),
(2, 'OPExCATer na Roda de conversa sobre Ruralidade do Museu Agrícola de Riachos', '', 'Na passada 5ª feira, dia 21 de julho, decorreu no Museu Agrícola de Riachos (entidade parceira do projeto OPExCATer) uma atividade denominada “Roda de conversa sobre Ruralidade”. Contou com a presença de Mário Antunes (coordenador da Reserva da Biosfera do Paul do Boquilobo e parceiro do Projeto), José Cunha Barros e Carlos Simões Nuno (antropólogos) e Luiz Oosterbeek ( coordenador da Cátedra UNESCO de Humanidades e Paisagens Culturais). A sessão foi dinamizada por Luís Mota Figueira – investigador encarregue da Tarefa 3 do referido projeto. Também esteve integrada nos trabalhos a Investigadora responsável – Cecília Baptista.', '', '20220721_203209.jpg', '2022-07-25', NULL, '2023-07-10 22:10:17'),
(3, 'Visita de João Freitas Coroado, Célio Gonçalo Marques e Eugénio Almeida à Universidade de Malta', 'Visit of João Freitas Coroado, Célio Gonçalo Marques and Eugénio Almeida to the University of Malta', '<p>Entre os dias <strong>20 e 24 de novembro</strong>, João Freitas Coroado, Presidente do Politécnico de Tomar e Investigador Integrado do TECHN&amp;ART, Célio Gonçalo Marques, Diretor do TECHN&amp;ART e o professor Eugénio Almeida, deslocaram-se à Universidade de Malta com o intuito de promover parcerias ao nível da formação e investigação, nomeadamente nos domínios científicos do TECHN&amp;ART e das restantes unidades de I&amp;D. A comitiva do IPT foi recebida pelo Reitor da Universidade, Alfred J. Vella, e pela sua equipa, tendo também realizado reuniões com o diretor e professores da Faculdade de Tecnologias de Informação e Comunicação e com o Diretor do Instituto dos Sistemas da Terra.</p>', '<p>Between the<strong> 20th and 24th of November,</strong> João Freitas Coroado, President of the Polytechnic of Tomar and Integrated Researcher at TECHN&amp;ART, Célio Gonçalo Marques, Director of TECHN&amp;ART and professor Eugénio Almeida, traveled to the University of Malta with the aim of promoting partnerships at the level of training and research, particularly in the scientific domains of TECHN&amp;ART and the remaining R&amp;D units. The IPT delegation was received by the Rector of the University, Alfred J. Vella, and his team, and also held meetings with the director and professors of the Faculty of Information and Communication Technologies and with the Director of the Earth Systems Institute.</p>', '65326284ad0c5_652d7de8c96ca_WhatsApp Image 2022-12-02 at 09.14.06 (1).jpeg', '2023-02-12', 1, '2023-10-20 11:23:15');

-- --------------------------------------------------------

--
-- Table structure for table `oportunidades`
--

CREATE TABLE `oportunidades` (
  `id` int(11) NOT NULL,
  `imagem` varchar(100) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `titulo_en` varchar(255) NOT NULL,
  `conteudo` mediumtext NOT NULL,
  `conteudo_en` mediumtext NOT NULL,
  `visivel` tinyint(1) NOT NULL,
  `ultimo_editor` int(11) DEFAULT NULL,
  `timestamp_editado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `oportunidades`
--

INSERT INTO `oportunidades` (`id`, `imagem`, `titulo`, `titulo_en`, `conteudo`, `conteudo_en`, `visivel`, `ultimo_editor`, `timestamp_editado`) VALUES
(1, '64ac9a2d5beec_investigacao.jpg', 'Bolsa de Investigação em Conservação de Obras de Arte', 'Research Fellowship in Art Conservation', '<p>A unidade TECHN&amp;ART está oferecendo uma bolsa de pesquisa para a conservação de obras de arte. Como bolsista de pesquisa, você trabalhará em estreita colaboração com nossos pesquisadores, aplicando metodologias avançadas para preservar e restaurar obras de arte. Seu trabalho contribuirá para a valorização do patrimônio artístico e cultural, garantindo a sua preservação para as futuras gerações.</p>', '<p>The TECHN&amp;ART unit is offering a research fellowship in art conservation. As a research fellow, you will work closely with our researchers, applying advanced methodologies to preserve and restore artworks. Your work will contribute to the enhancement of artistic and cultural heritage, ensuring its preservation for future generations.</p>', 1, 1, '2023-07-10 23:54:21'),
(2, '64ac9a6d1e566_repair.jpg', 'Estágio em Tecnologia Aplicada à Conservação de Patrimônio', 'Internship in Technology Applied to Heritage Conservation', '<p>Estamos em busca de estagiários entusiasmados em aplicar tecnologia à conservação de patrimônio. Como estagiário, você terá a oportunidade de trabalhar em projetos emocionantes que combinam arte, ciência e tecnologia. Colabore com nossa equipe multidisciplinar para desenvolver soluções inovadoras que preservem e valorizem o patrimônio artístico e cultural, utilizando ferramentas e técnicas de última geração.</p>', '<p>We are looking for enthusiastic interns to apply technology to heritage conservation. As an intern, you will have the opportunity to work on exciting projects that combine art, science, and technology. Collaborate with our multidisciplinary team to develop innovative solutions that preserve and enhance artistic and cultural heritage, using state-of-the-art tools and techniques.</p>', 1, 1, '2023-07-10 23:55:25'),
(3, '64ac9a68070ab_img.jpg', 'Bolsa de Pesquisa em Patrimônio Cultural Imaterial', 'Research Fellowship in Intangible Cultural Heritage', '<p>O TECHN&amp;ART oferece uma bolsa de pesquisa em patrimônio cultural imaterial. Como pesquisador, você terá a oportunidade de investigar e documentar tradições culturais intangíveis, preservando-as para as futuras gerações. Contribua para a valorização e divulgação desses elementos culturais únicos, promovendo a sua compreensão e apreciação na sociedade contemporânea.</p>', '<p>TECHN&amp;ART offers a research fellowship in intangible cultural heritage. As a researcher, you will have the opportunity to investigate and document intangible cultural traditions, preserving them for future generations. Contribute to the enhancement and dissemination of these unique cultural elements, promoting their understanding and appreciation in contemporary society.</p>', 1, 1, '2023-07-10 23:57:54');

-- --------------------------------------------------------

--
-- Table structure for table `projetos`
--

CREATE TABLE `projetos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `nome_en` varchar(100) NOT NULL,
  `descricao` mediumtext NOT NULL,
  `descricao_en` mediumtext NOT NULL,
  `sobreprojeto` mediumtext NOT NULL,
  `sobreprojeto_en` mediumtext NOT NULL,
  `referencia` varchar(100) NOT NULL,
  `referencia_en` varchar(100) NOT NULL,
  `areapreferencial` varchar(255) NOT NULL,
  `areapreferencial_en` varchar(255) NOT NULL,
  `financiamento` varchar(20) NOT NULL,
  `financiamento_en` varchar(20) NOT NULL,
  `ambito` varchar(100) NOT NULL,
  `ambito_en` varchar(100) NOT NULL,
  `site` varchar(255) NOT NULL,
  `site_en` varchar(100) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `facebook_en` varchar(100) NOT NULL,
  `fotografia` varchar(100) NOT NULL,
  `concluido` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projetos`
--

INSERT INTO `projetos` (`id`, `nome`, `nome_en`, `descricao`, `descricao_en`, `sobreprojeto`, `sobreprojeto_en`, `referencia`, `referencia_en`, `areapreferencial`, `areapreferencial_en`, `financiamento`, `financiamento_en`, `ambito`, `ambito_en`, `site`, `site_en`, `facebook`, `facebook_en`, `fotografia`, `concluido`) VALUES
(20, 'Figura', '', 'Integer a erat massa. Nunc sed pretium nulla. Donec tempor velit dui, sagittis gravida erat hendrerit ut.', '', '<p>A história de todos sobre o euismod. Diz-se que viveu nesta rua. Até os ultricies na urna, a massa da garganta, mas sempre diam. Fãs de futebol ao vivo, suaves ou justos, ele quer colocá-lo no ringue.</p>', '', '543212345', '', 'Maecenas', '', '4321€', '', 'Phasellus', '', '', '', '', '', 'P1310166.JPG', 0),
(21, 'INSIGNIA', '', 'Morbi mauris sem, convallis ut commodo quis, consequat ac velit.', '', 'Phasellus dapibus eros vel fringilla ullamcorper. Donec sit amet tempor neque, sit amet facilisis ligula. Fusce eget lacinia lectus. Morbi laoreet auctor vehicula. Cras eget semper sem.', '', '123456789', '', 'Aliquam', '', '3333€', '', 'Vivamus', '', '', '', '', '', 'Castelo de Abrantes1.jpg', 0),
(23, 'FesTab', '', 'Proin blandit sagittis dolor quis porttitor. Phasellus tortor felis, eleifend at nisi ac, pulvinar malesuada lectus.', '', 'Nunc non justo vel mauris semper rutrum. Curabitur at feugiat felis, nec cursus leo. Vivamus euismod sollicitudin tempor. Nunc non augue diam. Mauris rutrum, lorem a pellentesque finibus, tellus ante vulputate elit, at venenatis lorem nunc nec risus.', '', '123454321', '', 'Scelerisque', '', '1234€', '', 'Phasellus', '', '', '', '', '', 'IMG_6431.JPG', 0),
(24, 'MurArte', '', 'Donec in urna ultricies, faucibus massa sed, semper diam.', '', 'Maecenas auctor semper metus consectetur malesuada. Phasellus feugiat tellus tellus, eu convallis turpis malesuada id. Nullam ac laoreet neque, sed euismod augue.', '', '123456789', '', 'Fringilla', '', '3214€', '', 'Volutpat', '', '', '', '', '', '5c.JPG', 0),
(25, 'NATBIO', '', 'Quisque pellentesque euismod condimentum. In hac habitasse platea dictumst.', '', 'Donec in urna ultricies, faucibus massa sed, semper diam. Vivamus turpis nisl, mollis vel justo consectetur, fringilla posuere velit. Maecenas auctor semper metus consectetur malesuada.', '', '654321789', '', 'Pellentesque', '', '7453€', '', 'Porttitor', '', '', '', '', '', '20220208_103402.jpg', 0),
(26, 'POR1FIO', '', 'Nullam ac laoreet neque, sed euismod augue.', '', 'Nunc non justo vel mauris semper rutrum. Curabitur at feugiat felis, nec cursus leo. Vivamus euismod sollicitudin tempor. Nunc non augue diam.', '', '56787654', '', 'Consectetur', '', '4760€', '', 'Lacinia', '', '', '', '', '', 'DSC_0010.JPG', 0),
(27, 'WaterRIVER. tour', '', 'Gestão sustentável da água na estratégia do turismo náutico do Médio Tejo', 'Sustainable water management in the nautical tourism strategy of Médio Tejo.', '<p>O turismo náutico desenvolvido através do recurso água-rio é fundamental para a consolidação de produtos turísticos que agregam nesta dimensão concetual um valor acrescentado para o território regional e nacional, de acordo com a Estratégia Turismo 2027. A água é um dos seis ativos diferenciadores do destino Portugal, surgindo mesmo como elemento prioritário de intervenção e de extrema importância, visto que a “a água constitui o suporte de ativos únicos localizados na sua grande maioria no interior do país e com potencial turístico” (Portugal, 2017). A Agenda 2030: Objetivos para o Desenvolvimento Sustentável (ODS), reforça ações que visem proteger e salvaguardar o património cultural e natural. Dessa forma, o turismo náutico surge como um importante produto dinamizador do território, podendo provocar a procura e a atratividade turística territorial. O rio e a sua valorização para a prática de wakeboard no Médio Tejo é essencial para uma gestão sustentável do território.&nbsp;</p><figure class=\"image image_resized image-style-side\" style=\"width:23.93%;\"><img src=\"http://localhost/Tech-Art/backoffice/assets/imgs_texto/image_6532f58d4fcda.png\"></figure><p>O projeto de wakeboard em Portugal, lançado em 2015, colocou o Médio Tejo no mapa dos maiores circuitos de wakeboard mundial. Numa extensão de cerca de 30 km, na Albufeira do Castelo de Bode foi criada a primeira estância de wakeboard do mundo com a implementação de cinco cable parks: Fernandaires (Vila de Rei), Lago Azul (Ferreira do Zêzere), Aldeia do Mato, (Abrantes), Trízio (Sertã) e Praia dos Montes (Tomar). Neste sentido, este projeto foca-se no turismo náutico através da prática do wakeboard com o objetivo de perceber as lógicas de atratividade do território numa ótica de valorização do património cultural e natural (ambiental).</p>', '<p>Nautical tourism developed through the use of river water is essential for the consolidation of tourist products that add value to the regional and national territory, according to the Tourism Strategy 2027. Water is one of the six differentiating assets of the destination Portugal, emerging as a priority element of intervention and extreme importance, as \"water constitutes the support of unique assets located mostly in the interior of the country and with tourism potential\" (Portugal, 2017). The 2030 Agenda: Sustainable Development Goals (SDGs) reinforces actions aimed at protecting and safeguarding cultural and natural heritage. Therefore, nautical tourism emerges as an important driving force for the territory, capable of generating demand and territorial tourist attractiveness. The river and its valorization for wakeboarding in Médio Tejo are essential for sustainable territory management. The wakeboarding project in Portugal, launched in 2015, put Médio Tejo on the map of the largest wakeboarding circuits worldwide. In an area of about 30 km, the first wakeboarding resort in the world was created in the Castelo de Bode reservoir, with the implementation of five cable parks: Fernandaires (Vila de Rei), Lago Azul (Ferreira do Zêzere), Aldeia do Mato (Abrantes), Trízio (Sertã), and Praia dos Montes (Tomar). In this sense, this project focuses on nautical tourism through wakeboarding, with the aim of understanding the attractiveness of the territory in terms of cultural and natural (environmental) heritage enhancement.</p>', 'CFPI2020/01', '', 'Desenvolvimento sustentável e valorização do património cultural', '', '17 000,00 €', '', 'Nacional', 'Nacional', 'http://www.techneart.ipt.pt/waterivertour/pt/', 'http://www.techneart.ipt.pt/waterivertour/en/', '', '', '652d137503eca_64ad053b7a046_WaterRiver.tour.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `publicacoes`
--

CREATE TABLE `publicacoes` (
  `idPublicacao` varchar(50) NOT NULL,
  `dados` text NOT NULL,
  `data` date DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `tipo` varchar(100) NOT NULL,
  `visivel` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `publicacoes`
--

INSERT INTO `publicacoes` (`idPublicacao`, `dados`, `data`, `pais`, `cidade`, `tipo`, `visivel`) VALUES
('cv-prod-id-12303', '@inproceedings{cv-prod-id-12303,  title = {Monitoring a national open access funder mandate},   booktitle = {},   year = {2017},   pages = {},   publisher = {Elsevier},   author = {Carvalho, José and Laranjeira, Cátia and Vaz, Vasco and Moreira, João Mendes},   keywords = {Repositories, Open Access, Deposit, Compliance monitoring, Policy, Ciências Naturais::Ciências da Computação e da Informação, Science & Technology}}', '2017-01-01', 'Portugal', NULL, 'conference-paper', 1),
('cv-prod-id-12304', '@inproceedings{cv-prod-id-12304,  title = {Integrating a national network of institutional repositories into the national/international research management ecosystem},   booktitle = {},   year = {2017},   pages = {},   publisher = {Elsevier},   author = {Moreira, João Mendes and Laranjeira, Cátia and Carvalho, José and Ribeiro, Fernando and Lopes, Paulo and Graça, Paulo and Moreira, João Alexandre Reis Mendes},   keywords = {Network of Institutional Repositories, Research management ecosystem, Regulatory framework, Ciências Naturais::Ciências da Computação e da Informação, Open science, Science & Technology}}', '2017-01-01', 'Portugal', NULL, 'conference-paper', 1),
('cv-prod-id-12305', '@inproceedings{cv-prod-id-12305,  title = {Monitoring a national open access funder mandate},   booktitle = {},   year = {2016},   pages = {},   publisher = {},   author = {Carvalho, José and Laranjeira, Cátia and Moreira, João Mendes and Vaz, Vasco},   keywords = {Repositories, Deposit, monitoring, Open Access, policy}}', '2016-01-01', 'Portugal', NULL, 'conference-paper', 1),
('cv-prod-id-12306', '@article{cv-prod-id-12306,  title = {Integrar uma rede de repositórios no ecossistema de gestão de ciência nacional},   journal = {},   volume = {},   number = {},   pages = {},   year = {2016},   url = {http://www.bad.pt/publicacoes/index.php/cadernos/article/view/1589},   author = {Carvalho, José and Moreira, João Mendes and Laranjeira, Cátia and Ribeiro, Fernando and Graça, Paulo and Lopes, Paulo},   keywords = {Ciências da Informação e Documentação}}', '2016-01-01', 'Portugal', NULL, 'journal-article', 0),
('cv-prod-id-12307', '@article{cv-prod-id-12307,  title = {Integrar uma rede de repositórios no ecossistema de gestão de ciência nacional},   journal = {},   volume = {},   number = {},   pages = {},   year = {2016},   url = {http://hdl.handle.net/1822/44329},   author = {Carvalho, José and Moreira, João Mendes and Laranjeira, Cátia and Ribeiro, Fernando and Graça, Paulo and Lopes, Paulo},   keywords = {Repositórios, Rede Nacional, Gestão, CRIS}}', '2016-01-01', 'Portugal', NULL, 'journal-article', 1),
('cv-prod-id-12308', '@inproceedings{cv-prod-id-12308,  title = {PT-CRIS: Um miradouro sobre o universo científico nacional},   booktitle = {},   year = {2015},   pages = {},   publisher = {Associação Portuguesa de Bibliotecários, Arquivistas e Documentalistas (APBAD)},   author = {Santos, André and Ramalho, José Carlos and Ferreira, Miguel and Silva, Hélder and Faria, Luís and Moreira, João Mendes and Rodrigues, Eloy and Carvalho, José},   keywords = {Ecossistema, Informação, Ciência, VIVO, PT-CRIS}}', '2015-01-01', 'Portugal', NULL, 'conference-paper', 1),
('cv-prod-id-12309', '@article{cv-prod-id-12309,  title = {An ORCID based synchronization framework for a national CRIS ecosystem},   journal = {},   volume = {},   number = {},   pages = {},   year = {2015},   url = {http://hdl.handle.net/1822/37843},   author = {Moreira, João Mendes and Cunha, Alcino and Macedo, Nuno Filipe Moreira},   keywords = {CRIS, ORCID-CASRAI, PT CRIS, Synchronisation Framework}}', '2015-01-01', 'Portugal', NULL, 'journal-article', 1),
('cv-prod-id-12310', '@book{cv-prod-id-12310,  title = {O RCAAP e a evolução do Acesso Aberto em Portugal},   volume = {},   edition = {},   pages = {},   year = {2013},   publisher = {Universidade do Minho. Serviços de Documentação (SDUM)},   url = {http://hdl.handle.net/1822/27919},   author = {Carvalho, José and Moreira, João Mendes and Saraiva, Ricardo},   editor = {},   keywords = {}}', '2013-01-01', 'Portugal', NULL, 'book', 1),
('cv-prod-id-12311', '@inproceedings{cv-prod-id-12311,  title = {Repositório Científico de Acesso Aberto de Portugal: uma ferramenta ao serviço da ciência portuguesa},   booktitle = {},   year = {2010},   pages = {},   publisher = {Associação Portuguesa de Bibliotecários, Arquivistas e Documentalistas (APBAD)},   author = {Moreira, João Mendes and Carvalho, José and Saraiva, Ricardo and Rodrigues, Eloy},   keywords = {Repositórios, Repositories, Acesso livre, Open access}}', '2010-01-01', 'Portugal', NULL, 'conference-paper', 1),
('cv-prod-id-12312', '@inproceedings{cv-prod-id-12312,  title = {Repositório Científico de Acesso Aberto de Portugal : uma ferramenta ao serviço da ciência portuguesa},   booktitle = {},   year = {2010},   pages = {},   publisher = {Associação Portuguesa de Bibliotecários, Arquivistas e Documentalistas (APBAD)},   author = {Moreira, João Mendes and Carvalho, José and Saraiva, Ricardo and Rodrigues, Eloy},   keywords = {Repositórios, Repositories, Acesso livre, Open access}}', '2010-01-01', 'Portugal', NULL, 'conference-paper', 1),
('cv-prod-id-12313', '@book{cv-prod-id-12313,  title = {O Repositório Científico de Acesso Aberto de Portugal: origem, evolução e desafios},   volume = {},   edition = {},   pages = {},   year = {2010},   publisher = {Edufba},   url = {http://hdl.handle.net/1822/11235},   author = {Carvalho, José and Moreira, João Mendes and Rodrigues, Eloy and Saraiva, Ricardo},   editor = {},   keywords = {}}', '2010-01-01', 'Portugal', NULL, 'book', 1),
('cv-prod-id-20981', '@book{cv-prod-id-20981,  title = {Nível de stress dos alunos do 1º ano da Faculdade de Ciências do Desporto e Educação Física da Universidade de Coimbra – Um estudo descritivo.},   volume = {},   edition = {1},   pages = {},   year = {2004},   publisher = {Universidade de Coimbra: faculdade de Ciências do desporto e Educação Física},   url = {},   author = {Sarmento, Hugo Miguel Borges},   editor = {},   keywords = {}}', '2004-01-01', 'Portugal', 'Coimbra', 'book', 0),
('cv-prod-id-20982', '@article{cv-prod-id-20982,  title = {Development and validation of a notational system to study the offensive process in football},   journal = {Medicina (Kaunas)},   volume = {46},   number = {6},   pages = {401--407},   year = {2010},   url = {http://medicina.kmu.lt/1006/1006-e.htm},   author = {Sarmento, Hugo Miguel Borges and Anguera, Maria Teresa and Campaniço, Jorge and Leitão, José Carlos and Sarmento, Hugo and Anguera, Teresa and Campanico, Jorge and Leitao, Jose},   keywords = {Football, T-patterns, Observational Methodology, Match Analysis}}', '2010-01-01', 'Lituânia', NULL, 'journal-article', 0),
('cv-prod-id-20983', '@book{cv-prod-id-20983,  title = {A Metodologia Observacional no contexto dos Jogos Desportivos Colectivos},   volume = {},   edition = {1},   pages = {},   year = {2011},   publisher = {UTAD},   url = {http://www.wook.pt/ficha/metodologia-observacional-aplicada-aos-jogos-desportivos-colectivos/a/id/12836874},   author = {Campaniço, Jorge and Sarmento, Hugo Miguel Borges and Leitão, José Carlos and Jonsson, Gudberg and Anguera, Maria Teresa},   editor = {},   keywords = {}}', '2011-01-01', 'Portugal', 'Vila Real', 'book', 0),
('cv-prod-id-20984', '@book{cv-prod-id-20984,  title = {O treino de guarda-redes no futebol de 11 – Uma abordagem contextual},   volume = {},   edition = {1},   pages = {},   year = {2011},   publisher = {UTAD},   url = {https://www.facebook.com/media/set/?set=o.268781249838969&type=3},   author = {Leitão, José Carlos and Campaniço, Jorge and Martins, João and Sarmento, Hugo Miguel Borges},   editor = {},   keywords = {}}', '2011-01-01', NULL, 'Vila Real', 'book', 0),
('cv-prod-id-20985', '@book{cv-prod-id-20985,  title = {Análise de jogo em futebol - Um estudo qualitativo com treinadores da I Liga Portuguesa.},   volume = {},   edition = {1},   pages = {},   year = {2013},   publisher = {UTAD},   url = {},   author = {Sarmento, Hugo Miguel Borges and Pereira, A. and Campaniço, Jorge and Anguera, Maria Teresa and Leitão, José Carlos},   editor = {},   keywords = {}}', '2013-01-01', NULL, 'Vila Real', 'book', 0),
('cv-prod-id-20986', '@inbook{cv-prod-id-20986,  title = {Regular patterns of play in the counterattack of the FC Barcelona and Manchester United football teams},   booktitle = {http://www.routledge.com/books/details/9780415643399/},   volume = {},   edition = {},   pages = {59--66},   year = {2013},   publisher = {Routledge},   url = {http://www.routledge.com/books/details/9780415643399/},   author = {Sarmento, Hugo Miguel Borges and Barbosa, António and Anguera, Maria Teresa and Campaniço, Jorge and Leitão, José Carlos},   editor = {},   keywords = {}}', '2013-01-01', NULL, 'London', 'book-chapter', 0),
('cv-prod-id-20987', '@inbook{cv-prod-id-20987,  title = {Soccer Match Analysis – Qualitative study with first Portuguese League coaches},   booktitle = {Performance Analysis of Sport IX },   volume = {},   edition = {},   pages = {10--16},   year = {2013},   publisher = {Routledge},   url = {http://www.amazon.com/Performance-Analysis-Sport-Derek-Peters/dp/0415643392},   author = {Sarmento, Hugo Miguel Borges and Pereira, A. and Campaniço, Jorge and Anguera, Maria Teresa and Leitão, José Carlos},   editor = {},   keywords = {}}', '2013-01-01', NULL, 'London', 'book-chapter', 0),
('cv-prod-id-20988', '@inbook{cv-prod-id-20988,  title = {A observação da interação em contexto desportivo},   booktitle = {Desporto e Pedagogia – Formação e investigação },   volume = {},   edition = {},   pages = {173--186},   year = {2012},   publisher = {Coisas de Ler},   url = {},   author = {Sarmento, Hugo Miguel Borges and Martins, N. and Martins, João and Marques, Adilson and Anguera, Maria Teresa and Campaniço, Jorge and Leitão, José Carlos},   editor = {},   keywords = {}}', '2012-01-01', NULL, 'Lisboa', 'book-chapter', 0),
('cv-prod-id-20989', '@inbook{cv-prod-id-20989,  title = {Construção de instrumentos de observação: Apresentação de um exemplo no futebol},   booktitle = {Desporto e Pedagogia – Formação e investigação },   volume = {},   edition = {},   pages = {157--172},   year = {2012},   publisher = {Coisas de Ler},   url = {},   author = {Martins, N. and Sarmento, Hugo Miguel Borges and Campaniço, Jorge and Leitão, José Carlos},   editor = {},   keywords = {}}', '2012-01-01', NULL, 'Lisboa', 'book-chapter', 0),
('cv-prod-id-20990', '@inbook{cv-prod-id-20990,  title = {Análise da Performance em jogos desportivos colectivos – A evolução ao longo do tempo.},   booktitle = {A Metodologia Observacional no contexto dos Jogos Desportivos Colectivos},   volume = {},   edition = {},   pages = {5--14},   year = {2011},   publisher = {UTAD},   url = {},   author = {Sarmento, Hugo Miguel Borges and Anguera, Maria Teresa and Jonsson, Gudberg and Campaniço, Jorge and Leitão, José Carlos},   editor = {},   keywords = {}}', '2011-01-01', NULL, 'Vila Real', 'book-chapter', 0),
('cv-prod-id-20991', '@inbook{cv-prod-id-20991,  title = {Metodologia Observacional em contexto desportivo},   booktitle = {A Metodologia Observacional no contexto dos Jogos Desportivos Colectivos },   volume = {},   edition = {},   pages = {15--48},   year = {2011},   publisher = {UTAD},   url = {},   author = {Sarmento, Hugo Miguel Borges and Jonsson, Gudberg and Campaniço, Jorge and Leitão, José Carlos and Anguera, Maria Teresa},   editor = {},   keywords = {}}', '2011-01-01', NULL, 'Vila Real', 'book-chapter', 0),
('cv-prod-id-20992', '@inbook{cv-prod-id-20992,  title = {Desenvolvimento e validação de um Instrumento para Observação do Processo Ofensivo em Futebol},   booktitle = {A Metodologia Observacional no contexto dos Jogos Desportivos Colectivos },   volume = {},   edition = {},   pages = {53--75},   year = {2011},   publisher = {UTAD},   url = {},   author = {Sarmento, Hugo Miguel Borges and Anguera, Maria Teresa and Campaniço, Jorge and Leitão, José Carlos},   editor = {},   keywords = {}}', '2011-01-01', NULL, 'Vila Real', 'book-chapter', 0),
('cv-prod-id-20993', '@inbook{cv-prod-id-20993,  title = {O treino de guarda-redes no futebol de onze – Uma proposta prática.},   booktitle = {O Treino de Guarda-redes no futebol de onze – Uma abordagem contextual },   volume = {},   edition = {},   pages = {71--144},   year = {2011},   publisher = {UTAD},   url = {},   author = {Pereira, João and Sarmento, Hugo Miguel Borges and Leitão, José Carlos},   editor = {},   keywords = {}}', '2011-01-01', NULL, 'Vila Real', 'book-chapter', 0),
('cv-prod-id-20995', '@article{cv-prod-id-20995,  title = {T-patterns detection in the counter-attack of the F. C. Barcelona.},   journal = {Scientific Report Physical Education and Sport },   volume = {15},   number = {1},   pages = {12--16},   year = {2011},   url = {http://www.sportconference.ro/images/stories/2_Hugo_M._Sarmento.pdf},   author = {Sarmento, Hugo Miguel Borges and Barbosa, António and Campaniço, Jorge and Anguera, Maria Teresa and Leitão, José Carlos},   keywords = {}}', '2011-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-20996', '@article{cv-prod-id-20996,  title = {Playing Style –“direct play” vs “possession play” in the F. C. Barcelona},   journal = {Scientific Report Physical Education and Sport },   volume = {15},   number = {1},   pages = {112--117},   year = {2011},   url = {http://www.sportconference.ro/images/stories/26.Hugo_M._Sarmento.pdf},   author = {Sarmento, Hugo Miguel Borges and Barbosa, António and Campaniço, Jorge and Anguera, Maria Teresa and Leitão, José Carlos},   keywords = {}}', '2011-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-20998', '@article{cv-prod-id-20998,  title = {Comparative analysis of the counterattack between Real Madrid 10/11 and 09/10 Inter Milan.},   journal = {Scientific Report Physical Education and Sport },   volume = {15},   number = {1},   pages = {123--127},   year = {2011},   url = {},   author = {Barbosa, António and Sarmento, Hugo Miguel Borges and Anzano, A. and Campaniço, Jorge},   keywords = {}}', '2011-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-20999', '@article{cv-prod-id-20999,  title = {Sport motivation: a comparison between young football players competing at different levels.},   journal = {Atención Primaria},   volume = {},   number = {45},   pages = {53--53},   year = {2013},   url = {http://apps.elsevier.es/watermark/ctl_servlet?_f=10&pident_articulo=90201504&pident_usuario=0&pcontactid=&pident_revista=27&ty=30&accion=L&origen=zonadelectura&web=http://zl.elsevier.es&lan=en&fichero=27v45nEsp.Congresoa90201504pdf001.pdf},   author = {Sarmento, Hugo Miguel Borges and Marques, Adilson and Martins, N. and Resende, R.},   keywords = {}}', '2013-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21000', '@article{cv-prod-id-21000,  title = {Active and inactive boys and girls: do they share the same psychosocial characteristics?},   journal = {Atención Primaria},   volume = {},   number = {45},   pages = {153--153},   year = {2013},   url = {http://apps.elsevier.es/watermark/ctl_servlet?_f=10&pident_articulo=90201504&pident_usuario=0&pcontactid=&pident_revista=27&ty=30&accion=L&origen=zonadelectura&web=http://zl.elsevier.es&lan=en&fichero=27v45nEsp.Congresoa90201504pdf001.pdf},   author = {Bouw, M. and Almeida, T. and Martins, João and Sarmento, Hugo Miguel Borges and Marques, Adilson},   keywords = {}}', '2013-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21001', '@article{cv-prod-id-21001,  title = {Aerobic capacity associated with other physical fitness components among Portuguese students},   journal = {Atención Primaria},   volume = {},   number = {45},   pages = {53--54},   year = {2013},   url = {http://apps.elsevier.es/watermark/ctl_servlet?_f=10&pident_articulo=90201504&pident_usuario=0&pcontactid=&pident_revista=27&ty=30&accion=L&origen=zonadelectura&web=http://zl.elsevier.es&lan=en&fichero=27v45nEsp.Congresoa90201504pdf001.pdf},   author = {Almeida, T. and Bouw, M. and Martins, João and Sarmento, Hugo Miguel Borges and Marques, Adilson},   keywords = {}}', '2013-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21002', '@article{cv-prod-id-21002,  title = {Prevalence of active and passive transportation to and from school among urban children},   journal = {Atención Primaria},   volume = {},   number = {45},   pages = {86--86},   year = {2013},   url = {http://apps.elsevier.es/watermark/ctl_servlet?_f=10&pident_articulo=90201504&pident_usuario=0&pcontactid=&pident_revista=27&ty=30&accion=L&origen=zonadelectura&web=http://zl.elsevier.es&lan=en&fichero=27v45nEsp.Congresoa90201504pdf001.pdf},   author = {Marques, Adilson and Martins, João and Sarmento, Hugo Miguel Borges and Diniz, J. and Carreiro da Costa, F},   keywords = {}}', '2013-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21003', '@article{cv-prod-id-21003,  title = {Prevalence and correlates of recreational screen-time behaviours in children during weekdays},   journal = {Atención Primaria},   volume = {},   number = {45},   pages = {153--153},   year = {2013},   url = {http://apps.elsevier.es/watermark/ctl_servlet?_f=10&pident_articulo=90201504&pident_usuario=0&pcontactid=&pident_revista=27&ty=30&accion=L&origen=zonadelectura&web=http://zl.elsevier.es&lan=en&fichero=27v45nEsp.Congresoa90201504pdf001.pdf},   author = {Martins, João and Marques, Adilson and Sarmento, Hugo Miguel Borges and Diniz, J. and Carreiro da Costa, F},   keywords = {}}', '2013-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21004', '@article{cv-prod-id-21004,  title = {Children sports participation and sedentary behaviours on weekdays: How are they related with academic performance? },   journal = {Atención Primaria},   volume = {},   number = {45},   pages = {87--87},   year = {2013},   url = {http://apps.elsevier.es/watermark/ctl_servlet?_f=10&pident_articulo=90201504&pident_usuario=0&pcontactid=&pident_revista=27&ty=30&accion=L&origen=zonadelectura&web=http://zl.elsevier.es&lan=en&fichero=27v45nEsp.Congresoa90201504pdf001.pdf},   author = {Martins, João and Marques, Adilson and Sarmento, Hugo Miguel Borges and Diniz, J. and Carreiro da Costa, F},   keywords = {}}', '2013-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21005', '@article{cv-prod-id-21005,  title = {Motivation in soccer – A comparison between professionals, semi-professionals and amateur players},   journal = {Medicine & Science in Sports & Exercise},   volume = {44},   number = {5},   pages = {S461--S461},   year = {2012},   url = {},   author = {Sarmento, Hugo Miguel Borges and Marques, Adilson and Martins, João and Catita, Luís and Fonseca, António},   keywords = {}}', '2012-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21006', '@article{cv-prod-id-21006,  title = {Correlates of physical fitness among secondary school students},   journal = {Medicine & Science in Sports & Exercise},   volume = {44},   number = {5},   pages = {473--474},   year = {2012},   url = {},   author = {Marques, Adilson and Martins, João and Sarmento, Hugo Miguel Borges and Diniz, J. and Carreiro da Costa, F},   keywords = {}}', '2012-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21007', '@article{cv-prod-id-21007,  title = {The importance of attitudes towards physical activity and its relationship with practice of physical activity},   journal = {British Journal of Sports Medicine},   volume = {45},   number = {15},   pages = {A7--A7},   year = {2011},   url = {},   author = {Marques, A. and Martins, J. and Martins, M. and Costa, J. and Sarmento, H. and Onofre, M. and Carreiro da Costa, F},   keywords = {}}', '2011-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21008', '@article{cv-prod-id-21008,  title = {Tactical analysis of the Barcelona counter-attack},   journal = {British Journal of Sports Medicine},   volume = {45},   number = {15},   pages = {A4--A4},   year = {2011},   url = {},   author = {Sarmento, H. and Marques, A. and Martins, J. and Anguera, T. and Campanico, J. and Leitao, J.},   keywords = {}}', '2011-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21009', '@article{cv-prod-id-21009,  title = {Playing tactics in the English premier league, Spain\\\'s La Liga and Italy\\\'s Serie A},   journal = {British Journal of Sports Medicine},   volume = {45},   number = {15},   pages = {A6--A7},   year = {2011},   url = {},   author = {Sarmento, H. and Marques, A. and Martins, J. and Anguera, T. and Campanico, J. and Leitao, J.},   keywords = {}}', '2011-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21010', '@article{cv-prod-id-21010,  title = {Analysis of the existence of patterns related to counter-attack and fast attack in the Spanish League 2010/2011 season},   journal = {British Journal of Sports Medicine},   volume = {45},   number = {15},   pages = {A11--A12},   year = {2011},   url = {},   author = {Barbosa, A. and Martins, N. and Leitao, J. and Campanico, J. and Sarmento, H.},   keywords = {}}', '2011-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21011', '@article{cv-prod-id-21011,  title = {Temporal interaction patterns in the offensive process in the Spanish League 2010/2011 season},   journal = {British Journal of Sports Medicine},   volume = {45},   number = {15},   pages = {A9--A9},   year = {2011},   url = {},   author = {Barbosa, A. and Martins, N. and Leitao, J. and Sarmento, H. and Campanico, J.},   keywords = {}}', '2011-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21013', '@article{cv-prod-id-21013,  title = {Metodologia observacional em futebol: Desenvolvimento do instrumento de observação do comportamento do guarda-redes},   journal = {Revista Portuguesa de Ciências do Desporto},   volume = {11},   number = {S4},   pages = {51--51},   year = {2011},   url = {},   author = {Esteves, A. and Martins, N. and Sarmento, Hugo Miguel Borges and Leitão, José Carlos and Campaniço, Jorge},   keywords = {}}', '2011-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21014', '@article{cv-prod-id-21014,  title = {Detecção de T-patterns no comportamento do Guarda-Redes durante o processo defensivo},   journal = {Revista Portuguesa de Ciências do Desporto},   volume = {11},   number = {s4},   pages = {51--51},   year = {2011},   url = {},   author = {Esteves, A. and Martins, N. and Sarmento, Hugo Miguel Borges and Leitão, José Carlos and Campaniço, Jorge},   keywords = {}}', '2011-01-01', 'Portugal', NULL, 'journal-article', 0),
('cv-prod-id-21015', '@article{cv-prod-id-21015,  title = {Desenvolvimento e validação de um instrumento de observação no futebol: OBSPD},   journal = {Revista Portuguesa de Ciências do Desporto},   volume = {11},   number = {4},   pages = {66--66},   year = {2011},   url = {},   author = {Martins, N. and Esteves, A. and Sarmento, Hugo Miguel Borges and Campaniço, Jorge and Leitão, José Carlos},   keywords = {}}', '2011-01-01', 'Portugal', NULL, 'journal-article', 0),
('cv-prod-id-21016', '@article{cv-prod-id-21016,  title = {Detecção de t-patterns no processo defensivo em futebol},   journal = {Revista Portuguesa de Ciências do Desporto},   volume = {11},   number = {4},   pages = {67--67},   year = {2011},   url = {},   author = {Martins, N. and Esteves, A. and Sarmento, Hugo Miguel Borges and Leitão, José Carlos and Campaniço, Jorge},   keywords = {}}', '2011-01-01', 'Portugal', NULL, 'journal-article', 0),
('cv-prod-id-21018', '@inproceedings{cv-prod-id-21018,  title = {O jogo ofensivo no futebol. Proposta de interpretação da realidade dinâmica.},   booktitle = {Proceedings of the IX Seminário internacional Educação Física, Lazer e Saúde, SIEFLAS 2013 – Desafios e oportunidades num mundo em mudança},   year = {2013},   pages = {246--262},   publisher = {},   author = {Barbosa, António and Sarmento, Hugo Miguel Borges and Anzano, A. and Campaniço, Jorge},   keywords = {}}', '2013-01-01', 'Portugal', 'Braga', 'conference-paper', 0),
('cv-prod-id-21019', '@inproceedings{cv-prod-id-21019,  title = {A comparison of playing tactics in the English Premier League, Spain ´s la Liga and Italy ´s Serie A. },   booktitle = {Prooceeding of 6th International scientific Conference on Kinesiology: Integrative power of Kinesiology},   year = {2011},   pages = {546--551},   publisher = {},   author = {Sarmento, Hugo Miguel Borges and Campaniço, Jorge and Anguera, Maria Teresa and Leitão, José Carlos},   keywords = {}}', '2011-01-01', 'Croácia', 'Opitajia', 'conference-paper', 0),
('cv-prod-id-21020', '@inproceedings{cv-prod-id-21020,  title = {Defensive process of world cup 2006 and euro 2008: T-pattern analysis.},   booktitle = {Proceedings of the 6th International scientific Conference on Kinesiology: Integrative power of Kinesiology},   year = {2011},   pages = {533--537},   publisher = {},   author = {Martins, N. and Sarmento, Hugo Miguel Borges and Leitão, José Carlos},   keywords = {}}', '2011-01-01', 'Croácia', 'Opitajia', 'conference-paper', 0),
('cv-prod-id-21021', '@inproceedings{cv-prod-id-21021,  title = {Estudo de Padrões de Comportamento no Contra-Ataque de Equipas de Futebol de Rendimento Superior},   booktitle = {Atas do 3º Congresso de Jogos Desportivos Colectivos. Jogos Desportivos Colectivos: Treino, Formação, Performance},   year = {2011},   pages = {88--88},   publisher = {},   author = {Sarmento, Hugo Miguel Borges and Martins, N. and Esteves, A. and Anguera, Maria Teresa and Campaniço, Jorge and Leitão, José Carlos},   keywords = {}}', '2011-01-01', 'Portugal', 'Porto', 'conference-paper', 0),
('cv-prod-id-21025', '@inproceedings{cv-prod-id-21025,  title = {Sport Motivation – A comparison between adult football players competing at different level. },   booktitle = {Proceedings of the 6th International scientific Conference on Kinesiology: Kinesiology Research Trends and Applications},   year = {2008},   pages = {631--634},   publisher = {},   author = {Sarmento, Hugo Miguel Borges and Catita, Luís and Fonseca, António},   keywords = {}}', '2008-01-01', 'Croácia', 'Zagreb', 'conference-paper', 0),
('cv-prod-id-21026', '@article{cv-prod-id-21026,  title = {Observação e análise do jogo de futebol – Um estudo qualitativo com treinadores da I Liga portuguesa},   journal = { 9º Congresso Nacional de Educação Física – Renovar o presente, desafiar o futuro },   volume = {},   number = {},   pages = {},   year = {2013},   author = {Sarmento, Hugo Miguel Borges and Pereira, A. and Campaniço, Jorge and Leitão, José Carlos},   keywords = {}}', '2013-01-01', 'Portugal', 'Lisboa', 'conference-abstract', 0),
('cv-prod-id-21027', '@article{cv-prod-id-21027,  title = {Modelo de organização da dinâmica do jogo ofensivo no futebol},   journal = {9º Congresso Nacional de Educação Física – Renovar o presente, desafiar o futuro },   volume = {},   number = {},   pages = {},   year = {2013},   author = {Barbosa, António and Sarmento, Hugo Miguel Borges and Anzano, A. and Campaniço, Jorge},   keywords = {}}', '2013-01-01', 'Portugal', 'Lisboa', 'conference-abstract', 0),
('cv-prod-id-21028', '@article{cv-prod-id-21028,  title = {The importance of the observation in football – Qualitative study with portuguese first league coaches},   journal = {17th Annual Congress of the European College of the Sport Science },   volume = {},   number = {},   pages = {},   year = {2012},   author = {Sarmento, Hugo Miguel Borges and Pereira, A. and Anguera, Maria Teresa and Campaniço, Jorge and Leitão, José Carlos},   keywords = {}}', '2012-01-01', 'Bélgica', 'Bruges', 'conference-abstract', 0),
('cv-prod-id-21029', '@article{cv-prod-id-21029,  title = {Regular patterns of play in effectiveness offensive sequences of FC Barcelona counterattack},   journal = {17th Annual Congress of the European College of the Sport Science },   volume = {},   number = {},   pages = {},   year = {2012},   author = {Sarmento, Hugo Miguel Borges and Barbosa, António and Martins, João and Anguera, Maria Teresa and Campaniço, Jorge and Leitão, José Carlos},   keywords = {}}', '2012-01-01', 'Bélgica', 'Bruges', 'conference-abstract', 0),
('cv-prod-id-21030', '@article{cv-prod-id-21030,  title = {Motivational climate in physical education: A comparison between the perceptions of students from classes of beginning teachers and experienced teachers.},   journal = {17th Annual Congress of the European College of the Sport Science },   volume = {},   number = {},   pages = {},   year = {2012},   author = {Martins, João and Marques, Adilson and Sarmento, Hugo Miguel Borges and Carreiro da Costa, F},   keywords = {}}', '2012-01-01', 'Portugal', 'Bruges', 'conference-abstract', 0),
('cv-prod-id-21031', '@article{cv-prod-id-21031,  title = {Motivational climate, achievement goals and students´ attitude towards physical education},   journal = {17th Annual Congress of the European College of the Sport Science },   volume = {},   number = {},   pages = {},   year = {2012},   author = {Martins, João and Marques, Adilson and Sarmento, Hugo Miguel Borges and Carreiro da Costa, F},   keywords = {}}', '2012-01-01', 'Portugal', 'Bruges', 'conference-abstract', 0),
('cv-prod-id-21032', '@article{cv-prod-id-21032,  title = {T-patterns regarding goal situations or eminente scoring situations.},   journal = {17th Annual Congress of the European College of the Sport Science },   volume = {},   number = {},   pages = {},   year = {2012},   author = {Barbosa, António and Sarmento, Hugo Miguel Borges and Anzano, A. and Campaniço, Jorge},   keywords = {}}', '2012-01-01', 'Portugal', 'bruges', 'conference-abstract', 0),
('cv-prod-id-21033', '@article{cv-prod-id-21033,  title = {Quantitative analysis of Real Madrid Offensive Processes. },   journal = {17th Annual Congress of the European College of the Sport Science },   volume = {},   number = {},   pages = {},   year = {2012},   author = {Barbosa, António and Sarmento, Hugo Miguel Borges and Anzano, A. and Campaniço, Jorge},   keywords = {}}', '2012-01-01', 'Bélgica', 'Bruges', 'conference-abstract', 0),
('cv-prod-id-21034', '@article{cv-prod-id-21034,  title = {Detection of counter-attack interaction patterns in football},   journal = {16th Annual Congress of the European College of the Sport Science },   volume = {},   number = {},   pages = {},   year = {2011},   author = {Sarmento, Hugo Miguel Borges and Martins, N. and Martins, João and Marques, Adilson and Barbosa, António and Anguera, Maria Teresa and Campaniço, Jorge and Leitão, José Carlos},   keywords = {}}', '2011-01-01', 'Reino Unido', 'Liverpool', 'conference-abstract', 0),
('cv-prod-id-21035', '@article{cv-prod-id-21035,  title = {Temporal patterns analysis in the goals scored by football teams},   journal = {16th Annual Congress of the European College of the Sport Science },   volume = {},   number = {},   pages = {},   year = {2011},   author = {Sarmento, Hugo Miguel Borges and Martins, N. and Martins, João and Marques, Adilson and Barbosa, António and Anguera, Maria Teresa and Campaniço, Jorge and Leitão, José Carlos},   keywords = {}}', '2011-01-01', NULL, 'Liverpool', 'conference-abstract', 0),
('cv-prod-id-21036', '@article{cv-prod-id-21036,  title = {Detecting patterns of play in football},   journal = {7th World Congress on Science & Football},   volume = {},   number = {},   pages = {},   year = {2011},   author = {Sarmento, Hugo Miguel Borges and Martins, N. and Campaniço, Jorge and Leitão, José Carlos},   keywords = {}}', '2011-01-01', 'Japão', 'Nagoya', 'conference-abstract', 0),
('cv-prod-id-21037', '@article{cv-prod-id-21037,  title = {Relationship between time watching TV, computer using, electronic games, and time practicing pa of children},   journal = {16th Annual Congress of the European College of the Sport Science},   volume = {},   number = {},   pages = {},   year = {2011},   author = {Marques, Adilson and Martins, João and Sarmento, Hugo Miguel Borges and Martins, N. and Costa, J. and Onofre, M. and Carreiro da Costa, F},   keywords = {}}', '2011-01-01', NULL, 'Liverpool', 'conference-abstract', 0),
('cv-prod-id-21038', '@article{cv-prod-id-21038,  title = {Physical education, physical activity and academic performance. },   journal = {16th Annual Congress of the European College of the Sport Science},   volume = {},   number = {},   pages = {},   year = {2011},   author = {Martins, João and Marques, Adilson and Sarmento, Hugo Miguel Borges and Carreiro da Costa, F},   keywords = {}}', '2011-01-01', NULL, 'Liverpool', 'conference-abstract', 0),
('cv-prod-id-21039', '@article{cv-prod-id-21039,  title = {Physical activity levels and determinants to practice according to age in girls that attended Portuguese public schools},   journal = {16th Annual Congress of the European College of the Sport Science},   volume = {},   number = {},   pages = {},   year = {2011},   author = {Martins, João and Marques, Adilson and Sarmento, Hugo Miguel Borges and Martins, N. and Costa, J. and Onofre, M. and Carreiro da Costa, F},   keywords = {}}', '2011-01-01', NULL, 'Liverpool', 'conference-abstract', 0),
('cv-prod-id-21040', '@article{cv-prod-id-21040,  title = {Development and validation of a notational system to study the defensive process in footbal},   journal = {16th Annual Congress of the European College of the Sport Science},   volume = {},   number = {},   pages = {},   year = {2011},   author = {Martins, N. and Sarmento, Hugo Miguel Borges and Barbosa, António and Campaniço, Jorge and Leitão, José Carlos},   keywords = {}}', '2011-01-01', 'Reino Unido', 'Liverpool', 'conference-abstract', 0),
('cv-prod-id-21041', '@article{cv-prod-id-21041,  title = {T-pattern detection analysis: Defensive process in football},   journal = {16th Annual Congress of the European College of the Sport Science },   volume = {},   number = {},   pages = {},   year = {2011},   author = {Martins, N. and Sarmento, Hugo Miguel Borges and Barbosa, António and Campaniço, Jorge and Leitão, José Carlos},   keywords = {}}', '2011-01-01', NULL, 'Liverpool', 'conference-abstract', 0),
('cv-prod-id-21043', '@article{cv-prod-id-21043,  title = {Tactical analysis of the Real Madrid offensive process},   journal = {Book of abstracts of the 16th Annual Congress of the European College of the Sport Science },   volume = {},   number = {},   pages = {},   year = {2011},   author = {Barbosa, António and Sarmento, Hugo Miguel Borges and Martins, N. and Leitão, José Carlos},   keywords = {}}', '2011-01-01', NULL, 'Liverpool', 'conference-abstract', 0),
('cv-prod-id-21044', '@article{cv-prod-id-21044,  title = {Temporal interaction patterns in the offensive process of Real Madrid football team.},   journal = {16th Annual Congress of the European College of the Sport Science},   volume = {},   number = {},   pages = {},   year = {2011},   author = {Barbosa, António and Sarmento, Hugo Miguel Borges and Martins, N. and Leitão, José Carlos},   keywords = {}}', '2011-01-01', NULL, 'Liverpool', 'conference-abstract', 0),
('cv-prod-id-21045', '@article{cv-prod-id-21045,  title = {Defensive process of football successful teams: t-pattern detection analysis},   journal = {7th World Congress on Science & Football },   volume = {},   number = {},   pages = {},   year = {2011},   author = {Martins, N. and Sarmento, Hugo Miguel Borges and Campaniço, Jorge and Leitão, José Carlos},   keywords = {}}', '2011-01-01', 'Japão', 'Nagoya', 'conference-abstract', 0),
('cv-prod-id-21046', '@article{cv-prod-id-21046,  title = {Development of a Notational Analysis System to Study the Offensive Process in Football.},   journal = {15th Annual Congress of the European College of Sport Science },   volume = {},   number = {},   pages = {},   year = {2010},   author = {Sarmento, Hugo Miguel Borges and Anguera, Maria Teresa and Campaniço, Jorge and Leitão, José Carlos},   keywords = {}}', '2010-01-01', NULL, 'Antalya', 'conference-abstract', 0),
('cv-prod-id-21048', '@article{cv-prod-id-21048,  title = {Participação dos jovens lisboetas nas actividades físicas e desportivas de acordo com a idade e o sexo},   journal = {1º congresso da SCPD},   volume = {},   number = {},   pages = {},   year = {2010},   author = {Marques, Adilson and Martins, João and Sarmento, Hugo Miguel Borges and Carreiro da Costa, F},   keywords = {}}', '2010-01-01', NULL, 'Tomar', 'conference-abstract', 0),
('cv-prod-id-21049', '@article{cv-prod-id-21049,  title = {Factores que explicam a motivação dos estudantes de uma instituição militar de ensino para a prática de actividade física},   journal = {1º congresso da SCPD },   volume = {},   number = {},   pages = {},   year = {2010},   author = {André, J. and Almeida, N. and Sarmento, Hugo Miguel Borges and Martins, João and Marques, Adilson},   keywords = {}}', '2010-01-01', NULL, 'Tomar', 'conference-abstract', 0),
('cv-prod-id-21051', '@article{cv-prod-id-21051,  title = {Determinantes para a prática de actividade física em raparigas que frequentam estabelecimentos militares de ensino portugueses.},   journal = {1º congresso da SCPD},   volume = {},   number = {},   pages = {},   year = {2010},   author = {Martins, João and Sarmento, Hugo Miguel Borges and Marques, Adilson and Carreiro da Costa, F},   keywords = {}}', '2010-01-01', 'Portugal', 'Tomar', 'conference-abstract', 0),
('cv-prod-id-21052', '@article{cv-prod-id-21052,  title = {Observational Methodology in Football: Development of an instrument to study Goalkeeper Behavior in the defensive process – SOFGr1},   journal = {14th Annual Congress of the European College of Sport Science },   volume = {},   number = {},   pages = {},   year = {2010},   author = {Sarmento, Hugo Miguel Borges and Esteves, A. and Martins, N. and Oliveira, C. and Leitão, José Carlos and Anguera, Maria Teresa and Campaniço, Jorge},   keywords = {}}', '2010-01-01', 'Noruega', 'Oslo', 'conference-abstract', 0),
('cv-prod-id-21053', '@article{cv-prod-id-21053,  title = {Goal Orientation Differences on Self- Determination and beliefs About the Nature and Determinants of Sport Competence – A Study of Portuguese Footballers. },   journal = {14th Annual Congress of the European College of Sport Science },   volume = {},   number = {},   pages = {},   year = {2010},   author = {Sarmento, Hugo Miguel Borges},   keywords = {}}', '2010-01-01', 'Noruega', 'Oslo', 'conference-abstract', 0),
('cv-prod-id-21054', '@article{cv-prod-id-21054,  title = {A motivação em futebolistas Portugueses. Quais as diferenças em função da idade e do nível competitivo? },   journal = { 8º Congresso Nacional de Educação Física – Educação, Saúde e desenvolvimento profissional em Educação Física },   volume = {},   number = {},   pages = {},   year = {2009},   author = {Sarmento, Hugo Miguel Borges and Catita, Luís and Fonseca, António},   keywords = {}}', '2009-01-01', 'Portugal', 'Lisboa', 'conference-abstract', 0),
('cv-prod-id-21055', '@article{cv-prod-id-21055,  title = {Goal Orientation Differences on Self- Determination and beliefs About the Nature and Determinants of Sport Competence},   journal = {II Congreso Internacional de Ciencias del Deporte de la Universidad de Vigo },   volume = {},   number = {},   pages = {},   year = {2009},   author = {Sarmento, Hugo Miguel Borges and Catita, Luís and Fonseca, António},   keywords = {}}', '2009-01-01', 'Portugal', 'Vigo', 'conference-abstract', 0),
('cv-prod-id-21056', '@article{cv-prod-id-21056,  title = {Sport Motivation – A Comparison Between Adult Football Players Competing in Professional and Amateur Levels},   journal = {II Congreso Internacional de Ciencias del Deporte de la Universidad de Vigo },   volume = {},   number = {},   pages = {},   year = {2009},   author = {Sarmento, Hugo Miguel Borges},   keywords = {}}', '2009-01-01', 'Espanha', 'Vigo', 'conference-abstract', 0),
('cv-prod-id-21059', '@article{cv-prod-id-21059,  title = {Estudo dos padrões-T de comportamento de instrução em competição nos Treinadores de Futebol Jovem},   journal = {III Congresso da Sociedade Científica de Pedagogia do Desporto – Pedagogia do Desporto: Contextos e contrangimentos},   volume = {},   number = {},   pages = {},   year = {2013},   author = {Santos, F. and Sarmento, Hugo Miguel Borges and Louro, H. and Lopes, H. and Rodrigues, J.},   keywords = {}}', '2013-01-01', 'Portugal', 'Espinho', 'conference-abstract', 0),
('cv-prod-id-21061', '@article{cv-prod-id-21061,  title = {The Coaching Process in Football – A qualitative perspective},   journal = {Montenegrin Journal of Sport Sciences and Medicine},   volume = {3},   number = {1},   pages = {9--16},   year = {2014},   url = {},   author = {Sarmento, Hugo Miguel Borges and Pereira, A. and Anguera, Maria Teresa and Campaniço, Jorge and Leitão, José Carlos},   keywords = {}}', '2014-01-01', 'Portugal', NULL, 'journal-article', 0),
('cv-prod-id-21062', '@article{cv-prod-id-21062,  title = {Match analysis in football: a systematic review},   journal = {Journal of Sports Sciences},   volume = {32},   number = {20},   pages = {1831--1843},   year = {2014},   url = {},   author = {Sarmento, Hugo and Marcelino, Rui and Anguera, M. Teresa and Campaniço, Jorge and Matos, Nuno and Leitão, José Carlos},   keywords = {}}', '2014-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21064', '@article{cv-prod-id-21064,  title = {Deteção de T-patterns em treinadores de futebol em competição},   journal = {Motricidade},   volume = {10},   number = {4},   pages = {64--83},   year = {2014},   url = {http://www.scielo.mec.pt/scielo.php?script=sci_arttext&pid=S1646-107X2014000400008},   author = {Santos, Fernando Jorge and Sarmento, Hugo Miguel and Louro, Hugo Gonçalo and Lopes, Hélder Manuel and Rodrigues, José Jesus and Santos,Fernando Jorge and Sarmento,Hugo Miguel and et al},   keywords = {metodologia observacional, comportamento, instrução, padrões, futebol}}', '2014-01-01', 'Portugal', NULL, 'journal-article', 0),
('cv-prod-id-21066', '@article{cv-prod-id-21066,  title = {Representação dos professores sobre o desporto escolar. },   journal = {Revista da UIIPS},   volume = {},   number = {2 (2)},   pages = {254--271},   year = {2014},   url = {},   author = {Resende, Rui and Almeida, A. and Pimenta, N. and Lima, R. and Sarmento, Hugo Miguel Borges and Castro, J.},   keywords = {}}', '2014-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21068', '@article{cv-prod-id-21068,  title = {Correlates of school sport participation: A cross-sectional study in urban Portuguese students},   journal = {Science & Sports},   volume = {29},   number = {4},   pages = {e31--e38},   year = {2014},   url = {},   author = {Marques, A. and Martins, J. and Santos, F. and Sarmento, H. and Carreiro da Costa, F},   keywords = {}}', '2014-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21069', '@article{cv-prod-id-21069,  title = {The prevalence of sedentary behaviours and physical activity of urban adolescents. A cross-sectional study using ecological momentary assessment},   journal = {Mitteilungen Klosterneuburg},   volume = {},   number = {64(3)},   pages = {427--435},   year = {2014},   url = {},   author = {Marques, A. and André, J. and Martins, J. and Sarmento, Hugo Miguel Borges and Diniz, J.},   keywords = {}}', '2014-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21070', '@article{cv-prod-id-21070,  title = {Coach education in volleyball: a study in five countries},   journal = {Journal of Physical Education and Sport},   volume = {14},   number = {4},   pages = {475--484},   year = {2014},   url = {},   author = {Resende, R. and Sarmento, H. and William, F. and Mesquita, I. and Juan, F.},   keywords = {}}', '2014-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21071', '@article{cv-prod-id-21071,  title = {English Premier League, Spain´s La Liga and Italy´s Serie´s A – What´s Different? },   journal = {International Journal of Sport Performance Analysis},   volume = {},   number = {13},   pages = {773--789},   year = {2014},   url = {},   author = {Sarmento, Hugo Miguel Borges and Pereira, A. and Matos, N. and Campaniço, Jorge and Anguera, Maria Teresa and Leitão, José Carlos},   keywords = {}}', '2014-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21072', '@book{cv-prod-id-21072,  title = {A metodologia observacional como método de análise do de futebol - Padrões de jogo ofensivo em equipas de alto rendimento},   volume = {},   edition = {1},   pages = {},   year = {2013},   publisher = {Serviços Editoriais dos SBD},   url = {},   author = {Sarmento, Hugo Miguel Borges and Pereira, A. and Campaniço, Jorge and Anguera, Maria Teresa and Leitão, José Carlos},   editor = {},   keywords = {}}', '2013-01-01', NULL, 'Vila Real', 'book', 0),
('cv-prod-id-21073', '@article{cv-prod-id-21073,  title = {Soccer Analysis of the international milan long term attack that end sucessfully},   journal = {CIDESD 2014, International Congress and Sports Performance},   volume = {},   number = {},   pages = {},   year = {2014},   author = {Barbosa, A. and Sarmento, Hugo Miguel Borges and Neto, José and Campaniço, Jorge},   keywords = {}}', '2014-01-01', NULL, 'Guarda', 'conference-abstract', 0),
('cv-prod-id-21074', '@inproceedings{cv-prod-id-21074,  title = {Excellence in orienteering: Representation from elite coaches},   booktitle = {Book of abstracts of the CIDESD 2014, International Congress and Sports Performance},   year = {2014},   pages = {},   publisher = {},   author = {Celestino, T. and Leitão, José Carlos and Sarmento, Hugo Miguel Borges and Marques, Adilson and Pereira, A.},   keywords = {}}', '2014-01-01', NULL, 'Guarda', 'conference-paper', 0),
('cv-prod-id-21075', '@inproceedings{cv-prod-id-21075,  title = {Análise da ação de cruzamento na equipa do Real Madrid},   booktitle = {Livro de atas da I Conferência Internacional de Ciências no Treino de Futebol},   year = {2014},   pages = {},   publisher = {},   author = {Sarmento, Hugo Miguel Borges and Barbosa, A. and Neto, José and Campaniço, Jorge},   keywords = {}}', '2014-01-01', NULL, 'Coimbra', 'conference-paper', 0),
('cv-prod-id-21076', '@article{cv-prod-id-21076,  title = {A excelência na orientação: caraterização a partir das representações de treinadores de elite. },   journal = {4º Congresso da Sociedade Cientifica de Pedagogia do Desporto},   volume = {},   number = {},   pages = {},   year = {2014},   author = {Celestino, T. and Leitão, José Carlos and Sarmento, Hugo Miguel Borges and Marques, Adilson and Pereira, A.},   keywords = {}}', '2014-01-01', NULL, 'Guarda', 'conference-abstract', 0),
('cv-prod-id-21077', '@article{cv-prod-id-21077,  title = {Níveis de stress e rendimento escolar em alunos de desporto e atividade física},   journal = {4º Congresso da Sociedade Cientifica de Pedagogia do Desporto},   volume = {},   number = {},   pages = {},   year = {2014},   author = {Sarmento, Hugo Miguel Borges and Arede, J. and Figueiredo, A. and Marques, Adilson and Mendes, F. and Martins, João and Pereira, A.},   keywords = {}}', '2014-01-01', NULL, 'Guarda', 'conference-abstract', 0),
('cv-prod-id-21078', '@article{cv-prod-id-21078,  title = {Caraterização de raparigas adolescentes com um estilo de vida fisicamente ativo e pouco ativo},   journal = {4º Congresso da Sociedade Cientifica de Pedagogia do Desporto},   volume = {},   number = {},   pages = {},   year = {2014},   author = {Martins, João and Marques, Adilson and Sarmento, Hugo Miguel Borges and Santos, B. and Carreiro da Costa, F},   keywords = {}}', '2014-01-01', NULL, 'Guarda', 'conference-abstract', 0),
('cv-prod-id-21079', '@inproceedings{cv-prod-id-21079,  title = {Correlatos do transporte ativo dos adolescentes citadinos},   booktitle = {Revista da Sociedade Científica de Pedagogia do Desporto},   year = {2014},   pages = {},   publisher = {},   author = {Marques, Adilson and Peralta, M. and Martins, João and Sarmento, Hugo Miguel Borges and Carreiro da Costa, F},   keywords = {}}', '2014-01-01', NULL, 'Guarda', 'conference-paper', 0),
('cv-prod-id-21080', '@article{cv-prod-id-21080,  title = {A excelência no desporto orientação: singularidades de um campeão do mundo},   journal = {XV Jornadas da Sociedade Portuguesa de Psicologia do Desporto – Novos Horizontes da Psicologia do desporto e do Exercício},   volume = {},   number = {},   pages = {},   year = {2014},   author = {Celestino, T. and Leitão, José Carlos and Sarmento, Hugo Miguel Borges and Marques, Adilson and Pereira, A.},   keywords = {}}', '2014-01-01', NULL, 'Rio Maior', 'conference-abstract', 0),
('cv-prod-id-21081', '@inproceedings{cv-prod-id-21081,  title = {Rumo à excelência no desporto orientação: busca dos fatores influenciadores.},   booktitle = {Book of abstracts of the XV Jornadas da Sociedade Portuguesa de Psicologia do Desporto – Novos Horizontes da Psicologia do desporto e do Exercício},   year = {2014},   pages = {},   publisher = {},   author = {Celestino, T. and Leitão, J. and Sarmento, Hugo Miguel Borges and Marques, Adilson and Pereira, A.},   keywords = {}}', '2014-01-01', NULL, 'Rio Maior', 'conference-paper', 0),
('cv-prod-id-21082', '@inproceedings{cv-prod-id-21082,  title = {Football comparative analysis of fast attack beginnings between Real Madrid and Inter Milan},   booktitle = {Book of abstracts of the 11th International Conference of Montenegrin Sports Academy},   year = {2014},   pages = {33--39},   publisher = {},   author = {Barbosa, A. and Sarmento, Hugo Miguel Borges and Neto, José and Anguera, Maria Teresa and Campaniço, Jorge},   keywords = {}}', '2014-01-01', NULL, 'Podgorica', 'conference-paper', 0);
INSERT INTO `publicacoes` (`idPublicacao`, `dados`, `data`, `pais`, `cidade`, `tipo`, `visivel`) VALUES
('cv-prod-id-21083', '@article{cv-prod-id-21083,  title = {Manchester United, Internazionale Milano and FC Barcelona – What´s Different?},   journal = {11th International Conference of Montenegrin Sports Academy},   volume = {},   number = {40},   pages = {50--56},   year = {2014},   author = {Sarmento, Hugo Miguel Borges and Pereira, A. and Campaniço, Jorge and Anguera, Maria Teresa and Leitão, José Carlos},   keywords = {}}', '2014-01-01', NULL, 'Podgorica', 'conference-abstract', 0),
('cv-prod-id-21084', '@article{cv-prod-id-21084,  title = {Patterns of play in the “Positional attacks” and “Couterattack” of FC Barcelona football Team – A mixed Method Approach.},   journal = {11th International Conference of Montenegrin Sports Academy},   volume = {},   number = {},   pages = {},   year = {2014},   author = {Sarmento, Hugo Miguel Borges and Pereira, A. and Campaniço, Jorge and Anguera, Maria Teresa and Leitão, José Carlos},   keywords = {}}', '2014-01-01', NULL, 'Podgorica', 'conference-abstract', 0),
('cv-prod-id-21085', '@article{cv-prod-id-21085,  title = {Achievment goals orientations and self-determinated behaviours in soccer – A cluster analysis. },   journal = { World Conference on Science and Soccer 4.0 },   volume = {},   number = {},   pages = {},   year = {2014},   author = {Sarmento, Hugo Miguel Borges and Marques, Adilson and Fonseca, António},   keywords = {}}', '2014-01-01', NULL, 'Portland', 'conference-abstract', 0),
('cv-prod-id-21087', '@article{cv-prod-id-21087,  title = {Coaching and Coach Education in Portugal},   journal = {International Sport Coaching Journal},   volume = {3},   number = {2},   pages = {178--183},   year = {2016},   url = {},   author = {Resende, Rui and Sequeira, Pedro and Sarmento, Hugo},   keywords = {}}', '2016-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21088', '@article{cv-prod-id-21088,  title = {Desporto escolar: A opinião dos alunos de uma escola citadina},   journal = {Revista da Sociedade Científica de Pedagogia do Desporto},   volume = {3},   number = {1},   pages = {4--11},   year = {2014},   url = {},   author = {Sarmento, Hugo Miguel Borges and Mendes, C. and Lima, R. and Pimenta, N. and Castro, J. and Sarmento, Hugo},   keywords = {}}', '2014-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21089', '@article{cv-prod-id-21089,  title = {Fast atacks in soccer. Analysis of Real Madrid.},   journal = {Journal of Physhical Education and Sport},   volume = {14},   number = {2},   pages = {164--171},   year = {2014},   url = {},   author = {Barbosa, A. and Sarmento, Hugo Miguel Borges and Neto, José and Campaniço, Jorge},   keywords = {}}', '2014-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21091', '@article{cv-prod-id-21091,  title = {Objetivos de realização e autonomia percebida em futebolistas séniores},   journal = {Journal of Sport Pedagogy and Research},   volume = {1},   number = {6},   pages = {53--61},   year = {2015},   url = {},   author = {Moura, C. and Marques, Adilson and Sarmento, Hugo Miguel Borges},   keywords = {}}', '2015-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21093', '@article{cv-prod-id-21093,  title = {Socio-demographic correlates of leisure time physical activity among Portuguese adults},   journal = {Cadernos de Saúde Pública},   volume = {31},   number = {5},   pages = {1061--1070},   year = {2015},   url = {http://gateway.webofknowledge.com/gateway/Gateway.cgi?GWVersion=2&SrcAuth=ORCID&SrcApp=OrcidOrg&DestLinkType=FullRecord&DestApp=WOS_CPL&KeyUT=WOS:000356608800017&KeyUID=WOS:000356608800017},   author = {Marques, Adilson and Martins, João and Sarmento, Hugo and Ramos, Madalena and Diniz, José and Costa, Francisco Carreiro da and Marques, A. and et al},   keywords = {}}', '2015-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21094', '@article{cv-prod-id-21094,  title = {Do Students Know the Physical Activity Recommendations for Health Promotion?},   journal = {Journal of Physical Activity and Health},   volume = {12},   number = {2},   pages = {253--256},   year = {2015},   url = {},   author = {Marques, Adilson and Martins, João and Sarmento, Hugo and Rocha, Leonardo and Costa, Francisco Carreiro da},   keywords = {}}', '2015-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21097', '@article{cv-prod-id-21097,  title = {The road to excellence in orienteering: an analysis of elite athletes´life stories},   journal = {Journal of Physical Education and Sport},   volume = {15},   number = {2},   pages = {178--185},   year = {2015},   url = {},   author = {Tadeu Celestino and Leitão, José Carlos and Sarmento, Hugo Miguel Borges and Marques, Adilson and Pereira, Antonino},   keywords = {}}', '2015-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21098', '@article{cv-prod-id-21098,  title = {Prevalence of physical activity in European adults — Compliance with the World Health Organization\\\'s physical activity guidelines},   journal = {Preventive Medicine},   volume = {81},   number = {8},   pages = {333--338},   year = {2015},   url = {http://hdl.handle.net/10451/27451},   author = {Marques, Adilson and Sarmento, Hugo and Martins, João and Saboga Nunes, Luís and Marques, A. and Sarmento, H. and Martins, J. and Nunes, L. S. and Nunes, Luís Saboga},   keywords = {Adolescent, Adult, Cross-Sectional Studies, Europe, Female, Humans, Male, Middle Aged, Prevalence, Public Health, World Health Organization, Young Adult, Exercise, Guideline Adherence, Guidelines as Topic, Health Behavior, Lifestyle, Physical activity guidelines, Cross-sectional study}}', '2015-01-01', 'Portugal', NULL, 'journal-article', 0),
('cv-prod-id-21099', '@article{cv-prod-id-21099,  title = { Association between physical education, school-based physical activity, and academic performance: a systematic review},   journal = {Retos: nuevas tendencias en educación física, deporte y recreación},   volume = {},   number = {31},   pages = {316--320},   year = {2016},   url = {},   author = {Marques, Adilson and Gómez, Francisco and Martins, João and Cacunda, Ricardo and Sarmento, Hugo Miguel Borges},   keywords = {}}', '2016-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21103', '@inbook{cv-prod-id-21103,  title = {O árbitro de Futebol: representações, estímulos e constrangimentos},   booktitle = {A Ciência da arbitragem em Portugal },   volume = {},   edition = {},   pages = {109--117},   year = {2014},   publisher = {Federação Portuguesa de Futebol.},   url = {},   author = {Sarmento, Hugo Miguel Borges and Pereira, Antonino},   editor = {},   keywords = {}}', '2014-01-01', 'Portugal', 'Lisboa', 'book-chapter', 0),
('cv-prod-id-21104', '@inbook{cv-prod-id-21104,  title = {Tecnologia e treino desportivo: Implicações para a formação de treinadores.},   booktitle = {A formação e os saberes em Desporto, Educação Física e Lazer},   volume = {},   edition = {},   pages = {129--151},   year = {2015},   publisher = {Visão e Contextos},   url = {},   author = {Sarmento, Hugo Miguel Borges and Figueiredo, A. and Anguera, Maria Teresa},   editor = {},   keywords = {}}', '2015-01-01', NULL, 'Lisboa', 'book-chapter', 0),
('cv-prod-id-21105', '@inbook{cv-prod-id-21105,  title = {Tactical analysis of Barcelona, Inter Milan and Manchester United – A mixed Method Approach},   booktitle = {International Research in Science & Soccer II },   volume = {},   edition = {},   pages = {48--57},   year = {2016},   publisher = {Routledge},   url = {},   author = {Sarmento, Hugo Miguel Borges and Roma, P. and Marques, Adilson and Leitão, José Carlos and Anguera, Maria Teresa and Pereira, A. and Campaniço, Jorge},   editor = {},   keywords = {}}', '2016-01-01', NULL, 'London', 'book-chapter', 0),
('cv-prod-id-21106', '@article{cv-prod-id-21106,  title = {Análise dos padrões de jogo ofensivo do Manchester City},   journal = {1º Congresso Internacional de Atividade Física (28-30 May)},   volume = {},   number = {},   pages = {11--11},   year = {2015},   author = {Sant`ana, Tiago and Coelho, C. and Vieira, N. and Rocha, R. and Sarmento, Hugo Miguel Borges},   keywords = {}}', '2015-01-01', NULL, 'Castelo Branco', 'conference-abstract', 0),
('cv-prod-id-21107', '@inproceedings{cv-prod-id-21107,  title = {Análise dos esquemas táticos do mundial 2014.},   booktitle = {E-Balonmano – Revista de Ciencias del Deporte},   year = {2015},   pages = {},   publisher = {},   author = {Santos, V. and Soares, I. and Gonçalves, T. and Sarmento, Hugo Miguel Borges},   keywords = {}}', '2015-01-01', NULL, 'Castelo Branco', 'conference-paper', 0),
('cv-prod-id-21108', '@article{cv-prod-id-21108,  title = {Biomecânica e economia de corrida: estudo da ligação em estudos universitários},   journal = {1º Congresso Internacional de Atividade Física (28-30 May)},   volume = {},   number = {},   pages = {},   year = {2015},   author = {Arede, J. and Santos, R. and Sarmento, Hugo Miguel Borges},   keywords = {}}', '2015-01-01', NULL, 'Castelo Branco', 'conference-abstract', 0),
('cv-prod-id-21109', '@article{cv-prod-id-21109,  title = {Prevalence and correlates of active commuting among Portuguese adolescents considering the home-to-school distance},   journal = {World Congress of Children andYouth Health Behaviors},   volume = {48},   number = {1},   pages = {70--70},   year = {2016},   author = {Martins, João and Marques, Adilson and Sarmento, Hugo Miguel Borges and Diniz, J. and Carreiro da Costa, Francisco},   keywords = {}}', '2016-01-01', NULL, 'Viseu', 'conference-abstract', 0),
('cv-prod-id-21110', '@article{cv-prod-id-21110,  title = {Monitorização da atividade física e tática dos bombeiros voluntários de Tarouca em situação de combate às chamas.},   journal = {X Encontro Nacional de Riscos e II Jornadas Técnicas da Federação dos Bomeiros do Distrito de Viseu},   volume = {},   number = {},   pages = {78--78},   year = {2016},   author = {Marcelino, R. and Sampaio, J. and Sarmento, Humberto and Sarmento, Hugo Miguel Borges},   keywords = {}}', '2016-01-01', NULL, 'Viseu', 'conference-abstract', 0),
('cv-prod-id-21111', '@article{cv-prod-id-21111,  title = {O árbitro de futebol de 11 – Motivações, desmotivações, e perspetivas de futuro. },   journal = {VI Congresso da Sociedade portuguesa de Pedagogia do Desporto - As Transversalidades na Pedagogia do Desporto},   volume = {2},   number = {2},   pages = {15},   year = {2016},   author = {Sarmento, Hugo Miguel Borges and Marques, Adilson and Pereira, Antonino},   keywords = {}}', '2016-01-01', NULL, 'Viseu', 'conference-abstract', 0),
('cv-prod-id-21112', '@inproceedings{cv-prod-id-21112,  title = {Children and parents – Relationship between children activity and the perception of their parents´ activity},   booktitle = {Journal of Sport Pedagogy and Research},   year = {2016},   pages = {44},   publisher = {},   author = {Sarmento, Hugo Miguel Borges and Barbosa, A. and Marques, Adilson and Pereira, Antonino},   keywords = {}}', '2016-01-01', NULL, 'Viseu', 'conference-paper', 0),
('cv-prod-id-21113', '@article{cv-prod-id-21113,  title = {What Performance Analysts Need to Know About Research Trends in Association Football (2012–2016): A Systematic Review},   journal = {Sports Medicine},   volume = {},   number = {1},   pages = {1--38},   year = {2017},   url = {},   author = {Sarmento, Hugo Miguel Borges and Clemente, Filipe Manuel and Araújo, Duarte and Davids, Keith and McRobert, Allistair and Figueiredo, António},   keywords = {}}', '2017-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21114', '@article{cv-prod-id-21114,  title = {Socio-demographic correlates of physical activity among European older people},   journal = {European Journal of Ageing},   volume = {},   number = {0},   pages = {0--0},   year = {2017},   url = {},   author = {Peralta, Miguel and Martins, João and Guedes, Dartagnan Pinto and Sarmento, Hugo and Marques, Adilson},   keywords = {}}', '2017-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21115', '@article{cv-prod-id-21115,  title = {Effects  of  obesity  on  perception  of  ability  and  perception  of  body  image  in  Portuguese children  and adolescents},   journal = {Journal of Human Sport and Exercise},   volume = {11},   number = {2},   pages = {367--375},   year = {2016},   url = {http://www.redalyc.org/articulo.oa?id=301050351004},   author = {MIGUEL  PERALTA and ADILSON  MARQUES and JOÃO   MARTINS and HUGO  SARMENTO and FRANCISCO  CARREIRO DA COSTA},   keywords = {}}', '2016-01-01', 'Espanha', NULL, 'journal-article', 0),
('cv-prod-id-21116', '@article{cv-prod-id-21116,  title = {Exploring the perspectives of physically active and inactive adolescents: how does physical education influence their lifestyles?},   journal = {Sport, Education and Society},   volume = {},   number = {0},   pages = {1--15},   year = {2016},   url = {https://doi.org/10.1080/13573322.2016.1229290},   author = {Martins, J. and Marques, A. and Rodrigues, A. and Sarmento, H. and Onofre, M. and Carreiro da Costa, F. and João Martins and et al},   keywords = {}}', '2016-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21119', '@article{cv-prod-id-21119,  title = {Physical activity and sedentary behaviours patterns of adolescents using ecological momentary assessment | Identifica?\\{\\\\~a},   journal = {Revista Portuguesa de Saude Publica},   volume = {34},   number = {1},   pages = {38--45},   year = {2016},   url = {},   author = {Marques, A. and Peralta, M. and Martins, J. and Sarmento, H. and Carreiro Da Costa, F.},   keywords = {}}', '2016-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-21121', '@article{cv-prod-id-21121,  title = {ANÁLISE DOS ESQUEMAS TÁTICOS DO MUNDIAL 2014},   journal = {E-balonmano.com: Revista de Ciencias del Deporte},   volume = {},   number = {11},   pages = {99--100},   year = {2015},   url = {http://www.redalyc.org/articulo.oa?id=86538704050},   author = {Vito Santos and Inácio Soares and André Silva and Tiago Gonçalves and Hugo Sarmento and Sant`ana, Tiago and César Coelho and et al},   keywords = {}}', '2015-01-01', 'Espanha', NULL, 'journal-article', 0),
('cv-prod-id-21127', '@article{cv-prod-id-21127,  title = {TACTICAL ANALYSIS OF ELITE FOOTBALL TEAMS - A MIXED METHOD APROACH},   journal = {E-balonmano.com: Revista de Ciencias del Deporte},   volume = {},   number = {11},   pages = {67--68},   year = {2015},   url = {http://www.redalyc.org/articulo.oa?id=86538704034},   author = {Hugo Sarmento and Antonino  Pereira and Jorge Campaniço and Jorge Arede and José  Leitão},   keywords = {}}', '2015-01-01', 'Espanha', NULL, 'journal-article', 0),
('cv-prod-id-21128', '@article{cv-prod-id-21128,  title = {Adolescents` physical activity profile according to parental physical activity participation},   journal = {Journal of Human Sport and Exercise},   volume = {9},   number = {1},   pages = {81--90},   year = {2014},   url = {http://www.redalyc.org/articulo.oa?id=301031526009},   author = {Adilson Marques and João Martins and Hugo Sarmento and José Deniz and Francisco Carreiro da Costa and Marques, A. and Andre, J. and et al},   keywords = {}}', '2014-01-01', 'Espanha', NULL, 'journal-article', 0),
('cv-prod-id-21130', '@article{cv-prod-id-21130,  title = {T-patterns detection in competition football coaches | Detec?\\{\\\\~a},   journal = {Motricidade},   volume = {10},   number = {4},   pages = {64--83},   year = {2014},   url = {},   author = {Santos, F.J. and Sarmento, H.M. and Louro, H.G. and Lopes, H.M. and Rodrigues, J.J.},   keywords = {}}', '2014-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21135', '@article{cv-prod-id-21135,  title = {A COMPARISON OF PLAYING TACTICS IN THE ENGLISH PREMIER LEAGUE, SPANISH LA LIGA AND ITALIAN SERIE A},   journal = {6th International Scientific Conference on Kinesiology: Integrative Power of Kinesiology},   volume = {},   number = {1},   pages = {546--550},   year = {2011},   url = {},   author = {Sarmento, Hugo M. and Campanico, Jorge M. and Anguera, Maria T. and Leitao, Jose C. and Milanovic, D and Sporis, G},   keywords = {}}', '2011-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21136', '@article{cv-prod-id-21136,  title = {Motivacao para a prática de Futebol em contextos competitivos: estudo com futebolistas juniores e seniores a partir dos seus perfis motivacionais},   journal = {Revista Portuguesa de Ciencias do Desporto},   volume = {12},   number = {1},   pages = {116--129},   year = {2012},   url = {},   author = {Hugo Sarmento and Lus Catita and Antonio Manuel Fonseca},   keywords = {}}', '2012-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21137', '@article{cv-prod-id-21137,  title = {DEFENSIVE PROCESS OF THE WORLD CUP 2006 AND EURO CHAMPIONS 2008: T-PATTERN ANALYSIS},   journal = {6th International Scientific Conference on Kinesiology: Integrative Power of Kinesiology},   volume = {},   number = {1},   pages = {533--536},   year = {2011},   url = {http://gateway.webofknowledge.com/gateway/Gateway.cgi?GWVersion=2&SrcAuth=ORCID&SrcApp=OrcidOrg&DestLinkType=FullRecord&DestApp=WOS_CPL&KeyUT=WOS:000320409700149&KeyUID=WOS:000320409700149},   author = {Martins, Nuno M. and Sarmento, Hugo M. and Leitao, Jose C. and Milanovic, D and Sporis, G and Martins, N. M. and Sarmento, H. M. and Leitao, J. C.},   keywords = {}}', '2011-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21140', '@article{cv-prod-id-21140,  title = {The Influence of Tactical and Situational Variables on Offensive Sequences during Elite Football Matches},   journal = {Journal of Strength and Conditioning Research},   volume = {},   number = {0},   pages = {1--1},   year = {2017},   url = {},   author = {Sarmento, Hugo and Figueiredo, António and Lago-Peñas, Carlos and Milanovic, Zoran and Barbosa, António and Tadeu, Pedro and Bradley, Paul S},   keywords = {}}', '2017-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21141', '@article{cv-prod-id-21141,  title = {Physiological Demands, Morphological Characteristics, Physical Abilities and Injuries of Female Soccer Players},   journal = {Journal of Human Kinetics volume},   volume = {},   number = {60},   pages = {77--83},   year = {2017},   url = {},   author = {Milanovic, Zoran and Sporis, G. and James, N. and Trajkovic, N. and Ignjatovic, A. and Sarmento, Hugo Miguel Borges and Trecroci, N. and Mendes, B.},   keywords = {}}', '2017-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21142', '@article{cv-prod-id-21142,  title = {Portuguese football players – why so much talent?},   journal = {British Journal of Sports Medicine },   volume = {},   number = {51},   pages = {A4--A4},   year = {2017},   url = {},   author = {Sarmento, Hugo Miguel Borges and Pereira, Antonino and Anguera, M. T. and Araújo, Duarte},   keywords = {}}', '2017-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21143', '@article{cv-prod-id-21143,  title = {Multimorbidity and physical activity recommendations in european older adults},   journal = {British Journal of Sports Medicine},   volume = {},   number = {51},   pages = {A7--A7},   year = {2017},   url = {},   author = {Sarmento, Hugo Miguel Borges and Peralta, Miguel and Marques, Adilson},   keywords = {}}', '2017-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21144', '@article{cv-prod-id-21144,  title = {Identificação e desenvolvimento de talentos no futebol - Implicações para a intervenção dos treinadores. },   journal = {XVIII Jornadas da Sociedade Portuguesa de Psicologia do Desporto},   volume = {},   number = {},   pages = {},   year = {2017},   author = {Sarmento, Hugo Miguel Borges and Anguera, M. Teresa and Pereira, Antonino and Araújo, Duarte},   keywords = {}}', '2017-01-01', NULL, 'Bragança', 'conference-abstract', 0),
('cv-prod-id-21145', '@article{cv-prod-id-21145,  title = {Padrões (de treino e psicossociais) associados ao desenvolvimento da expertise em futebolistas. },   journal = {XVIII Jornadas da Sociedade Portuguesa de Psicologia do Desporto},   volume = {},   number = {},   pages = {},   year = {2017},   author = {Sarmento, Hugo Miguel Borges and Anguera, M. Teresa and Pereira, Antonino and Araújo, Duarte},   keywords = {}}', '2017-01-01', NULL, 'Bragança', 'conference-abstract', 0),
('cv-prod-id-21146', '@article{cv-prod-id-21146,  title = {Small sided games in soccer – a systematic review},   journal = {International Journal of Performance Analysis in Sport},   volume = {18},   number = {5},   pages = {693--749},   year = {2018},   url = {},   author = {Sarmento, Hugo Miguel Borges and Clemente, Filipe Manuel and Harper, Liam David and Costa, Israel Teoldo da and Owen, Adam and Figueiredo, António J.},   keywords = {}}', '2018-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21147', '@article{cv-prod-id-21147,  title = {Athletes’ perceptions of coaching competency and team conflict in sport teams: A multilevel analysis},   journal = {European Journal of Sport Science},   volume = {18},   number = {6},   pages = {851--860},   year = {2018},   url = {},   author = {González-Ponce, I. and Leo, F. M. and Jiménez, R. and Sánchez-Oliva, D. and Sarmento, H. and Figueiredo, A. and García-Calvo, T.},   keywords = {}}', '2018-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21148', '@article{cv-prod-id-21148,  title = {Talent Identification and Development in Male Football: A Systematic Review},   journal = {Sports Medicine},   volume = {48},   number = {4},   pages = {907--931},   year = {2018},   url = {},   author = {Sarmento, Hugo Miguel Borges and Anguera, M. Teresa and Pereira, Antonino and Araújo, Duarte},   keywords = {}}', '2018-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21149', '@article{cv-prod-id-21149,  title = {Achievement goals and self-determination in adult football players – a cluster analysis},   journal = {Kinesiology},   volume = {50},   number = {1},   pages = {43--51},   year = {2018},   url = {},   author = {Marques, Adilson and Sarmento, Hugo Miguel Borges},   keywords = {}}', '2018-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21150', '@article{cv-prod-id-21150,  title = {Variations of external load variables between medium- and large-sided soccer games in professional players},   journal = {Research in Sports Medicine},   volume = {},   number = {},   pages = {1--10},   year = {2019},   url = {https://doi.org/10.1080/15438627.2018.1511560},   author = {Filipe Manuel Clemente and Hugo Sarmento and Alireza Rabbani and Cornelis M. I. (Niels) Van Der Linden and Mehdi Kargarfard and Israel Teoldo Costa},   keywords = {}}', '2019-01-02', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21152', '@article{cv-prod-id-21152,  title = {Association between physical education, school-based physical activity, and academic performance: a systematic review},   journal = {Retos-Nuevas Tendencias En Educacion Fisica Deporte Y Recreacion},   volume = {},   number = {31},   pages = {316--320},   year = {2017},   url = {http://gateway.webofknowledge.com/gateway/Gateway.cgi?GWVersion=2&SrcAuth=ORCID&SrcApp=OrcidOrg&DestLinkType=FullRecord&DestApp=WOS_CPL&KeyUT=WOS:000396753600056&KeyUID=WOS:000396753600056},   author = {Marques, A. and Gomez, F. and Martins, J. and Catunda, R. and Sarmento, H.},   keywords = {}}', '2017-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21154', '@article{cv-prod-id-21154,  title = {Effects of obesity on perception of ability and perception of body image in Portuguese children and adolescents},   journal = {Journal of Human Sport and Exercise},   volume = {11},   number = {3},   pages = {367--375},   year = {2016},   url = {http://www.scopus.com/inward/record.url?eid=2-s2.0-85017018993&partnerID=MN8TOARS},   author = {Peralta, M. and Marques, A. and Martins, J. and Sarmento, H. and da Costa, F.C.},   keywords = {}}', '2016-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21155', '@article{cv-prod-id-21155,  title = {Psychosocial correlates of organized physical activity in Portuguese urban youth},   journal = {Motriz. Revista de Educacao Fisica},   volume = {22},   number = {4},   pages = {327--334},   year = {2016},   url = {http://www.scopus.com/inward/record.url?eid=2-s2.0-84994670355&partnerID=MN8TOARS},   author = {Marques, A. and Peralta, M. and Martins, J. and Sarmento, H. and Routen, A.C. and Da Costa, F.C. and Marques, Adilson and et al},   keywords = {}}', '2016-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21156', '@article{cv-prod-id-21156,  title = {Patterns of play in the fast attack of F. C. Barcelona, Manchester united and F. C. internazionale milano-A mixed method approach},   journal = {Cuadernos de Psicologia del Deporte},   volume = {16},   number = {1},   pages = {31--42},   year = {2016},   url = {http://www.scopus.com/inward/record.url?eid=2-s2.0-84963727179&partnerID=MN8TOARS},   author = {Sarmento, H. and Anguera, M.T. and Pereira, A. and Campaniço, J. and Leitão, J. and Hugo  Sarmento and M. Teresa  Anguera and et al},   keywords = {Soccer, Coaching, Mixed Methods, Performance}}', '2016-01-01', 'Portugal', NULL, 'journal-article', 0),
('cv-prod-id-21160', '@book{cv-prod-id-21160,  title = {Tactical analysis of Barcelona, Inter Milan and Manchester United counterattack A mixed method approach},   volume = {},   edition = {},   pages = {},   year = {2016},   publisher = {},   url = {http://gateway.webofknowledge.com/gateway/Gateway.cgi?GWVersion=2&SrcAuth=ORCID&SrcApp=OrcidOrg&DestLinkType=FullRecord&DestApp=WOS_CPL&KeyUT=WOS:000385613900006&KeyUID=WOS:000385613900006},   author = {Sarmento, H. and Roma, P. and Marques, A. and Leitao, J.},   editor = {Favero, T. and Drust, B. and Dawson, B.},   keywords = {}}', '2016-01-01', NULL, NULL, 'book', 0),
('cv-prod-id-21161', '@article{cv-prod-id-21161,  title = {Adolescents\\\' perspectives on the barriers and facilitators of physical activity: a systematic review of qualitative studies},   journal = {Health Education Research},   volume = {30},   number = {5},   pages = {742--755},   year = {2015},   url = {http://gateway.webofknowledge.com/gateway/Gateway.cgi?GWVersion=2&SrcAuth=ORCID&SrcApp=OrcidOrg&DestLinkType=FullRecord&DestApp=WOS_CPL&KeyUT=WOS:000362992600006&KeyUID=WOS:000362992600006},   author = {Martins, J. and Marques, A. and Sarmento, H. and da Costa, F. C. and Carreiro Da Costa, F.},   keywords = {}}', '2015-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21162', '@article{cv-prod-id-21162,  title = {Elite coaches views on factors contributing to excellence in orienteering},   journal = {Cultura Ciencia Y Deporte},   volume = {10},   number = {28},   pages = {77--86},   year = {2015},   url = {http://gateway.webofknowledge.com/gateway/Gateway.cgi?GWVersion=2&SrcAuth=ORCID&SrcApp=OrcidOrg&DestLinkType=FullRecord&DestApp=WOS_CPL&KeyUT=WOS:000366174700008&KeyUID=WOS:000366174700008},   author = {Celestino, T. F. and Leitao, J. C. G. and Sarmento, H. B. and Routen, A. and Pereira, A. A. and Ferreira Celestino, Tadeu and Gomes Leitão, José Carlos and et al},   keywords = {}}', '2015-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21163', '@article{cv-prod-id-21163,  title = {The Transition from Match Analysis to Intervention: Optimising the Coaching Process in Elite Futsal},   journal = {International Journal of Performance Analysis in Sport},   volume = {15},   number = {2},   pages = {471--488},   year = {2015},   url = {http://gateway.webofknowledge.com/gateway/Gateway.cgi?GWVersion=2&SrcAuth=ORCID&SrcApp=OrcidOrg&DestLinkType=FullRecord&DestApp=WOS_CPL&KeyUT=WOS:000370805900004&KeyUID=WOS:000370805900004},   author = {Sarmento, H. and Bradley, P. and Travassos, B. and Sarmento, Hugo Miguel Borges},   keywords = {}}', '2015-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21167', '@article{cv-prod-id-21167,  title = {BIOMECÂNICA E ECONOMIA DE CORRIDA: ESTUDO DA LIGAÇÃO EM ALUNOS UNIVERSITÁRIOS},   journal = {E-balonmano.com: Revista de Ciencias del Deporte},   volume = {},   number = {11},   pages = {91--92},   year = {2015},   url = {http://www.redalyc.org/articulo.oa?id=86538704046},   author = {Jorge Arede and Rogério Santos and Hugo Sarmento},   keywords = {}}', '2015-01-01', 'Espanha', NULL, 'journal-article', 0),
('cv-prod-id-21169', '@article{cv-prod-id-21169,  title = {Elite coaches views on factors contributing to excellence in orienteering | Representaciones de entrenadores de elite de los factores que contribuyen para la excelencia en orientación},   journal = {Cultura, Ciencia y Deporte},   volume = {10},   number = {28},   pages = {77--86},   year = {2015},   url = {http://www.scopus.com/inward/record.url?eid=2-s2.0-84924614035&partnerID=MN8TOARS},   author = {Celestino, T.F. and Leitão, J.C.G. and Sarmento, H.B. and Routen, A. and Pereira, A.A.},   keywords = {}}', '2015-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21170', '@article{cv-prod-id-21170,  title = {CONSTRUCTING AN INSTRUMENT TO OBSERVE AND ANALYSE INTERACTIONS IN WATERPOLO},   journal = {Revista De Psicologia Del Deporte},   volume = {23},   number = {1},   pages = {191--200},   year = {2014},   url = {http://gateway.webofknowledge.com/gateway/Gateway.cgi?GWVersion=2&SrcAuth=ORCID&SrcApp=OrcidOrg&DestLinkType=FullRecord&DestApp=WOS_CPL&KeyUT=WOS:000330745600023&KeyUID=WOS:000330745600023},   author = {Santos, S. and Sarmento, H. and Alves, J. and Campanico, J.},   keywords = {}}', '2014-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21173', '@article{cv-prod-id-21173,  title = {Construcción de un instrumento para la observación y el análisis de las interacciones en el waterpolo},   journal = {Revista de Psicología del Deporte},   volume = {23},   number = {1},   pages = {191--200},   year = {2014},   url = {http://www.redalyc.org/articulo.oa?id=235129571016},   author = {Sebastião Santos and Hugo Sarmento and José Alves and Jorge Campaniço and Santos, S. and Sarmento, Hugo Miguel Borges and Alves, J. and Campaniço, Jorge},   keywords = {}}', '2014-01-01', 'Espanha', NULL, 'journal-article', 0),
('cv-prod-id-21176', '@article{cv-prod-id-21176,  title = {Fast attack starts, in soccer. Analysis of Real Madrid},   journal = {Journal of Physical Education and Sport},   volume = {14},   number = {2},   pages = {164--171},   year = {2014},   url = {http://www.scopus.com/inward/record.url?eid=2-s2.0-84903529020&partnerID=MN8TOARS},   author = {Barbosa, A. and Sarmento, H. and Neto, J. and Campaniço, J. and Campani?o, J.},   keywords = {}}', '2014-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21178', '@article{cv-prod-id-21178,  title = {Constructing an instrument to observe and analyse interactions in waterpolo | Construcción de un instrumento para la observación y el análisis de las interacciones en el waterpolo},   journal = {Revista de Psicologia del Deporte},   volume = {23},   number = {1},   pages = {191--200},   year = {2014},   url = {http://www.scopus.com/inward/record.url?eid=2-s2.0-84893375972&partnerID=MN8TOARS},   author = {Santos, S. and Sarmento, H. and Alves, J. and Campaniço, J.},   keywords = {}}', '2014-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21179', '@article{cv-prod-id-21179,  title = {Padrões de jogo no contra ataque do Barcelona FC, Inter de Milão e Manchester United.},   journal = {},   volume = {},   number = {},   pages = {},   year = {2013},   url = {},   author = {},   keywords = {}}', '2013-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21180', '@article{cv-prod-id-21180,  title = {A metodologia observacional como método para análise do jogo de futebol – Uma perspetiva teórica.},   journal = {Boletim Spef},   volume = {},   number = {37},   pages = {9--20},   year = {2013},   url = {https://www.researchgate.net/publication/255791943_A_METODOLOGIA_OBSERVACIONAL_COMO_MTODO_PARA_ANLISE_DO_JOGO_DE_FUTEBOL__UMA_PERSPETIVA_TERICA?ev=pubfeed_inst},   author = {Sarmento, Hugo Miguel Borges and Anguera, Maria Teresa and Campaniço, Jorge and Leitão, José Carlos},   keywords = {}}', '2013-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21181', '@article{cv-prod-id-21181,  title = {English premier league, spains la liga and Italýs seriés a-what´s different?},   journal = {International Journal of Performance Analysis in Sport},   volume = {13},   number = {3},   pages = {773--779},   year = {2013},   url = {http://www.scopus.com/inward/record.url?eid=2-s2.0-84893370962&partnerID=MN8TOARS},   author = {Sarmento, H. and Pereira, A.A. and Matos, N. and Campaniço, J. and Anguera, M.T. and Leitão, J.},   keywords = {}}', '2013-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21182', '@article{cv-prod-id-21182,  title = {English Premier League, Spain\\\'s La Liga and Italy\\\'s Serie\\\'s A - What\\\'s Different?},   journal = {International Journal of Performance Analysis in Sport},   volume = {13},   number = {3},   pages = {773--789},   year = {2013},   url = {http://gateway.webofknowledge.com/gateway/Gateway.cgi?GWVersion=2&SrcAuth=ORCID&SrcApp=OrcidOrg&DestLinkType=FullRecord&DestApp=WOS_CPL&KeyUT=WOS:000328508800018&KeyUID=WOS:000328508800018},   author = {Sarmento, H. and Pereira, A. and Matos, N. and Campanico, J. and Anguera, M. T. and Leitao, J.},   keywords = {}}', '2013-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21188', '@book{cv-prod-id-21188,  title = {Soccer match analysis: A qualitative study with portuguese first league coaches},   volume = {},   edition = {},   pages = {},   year = {2013},   publisher = {},   url = {http://www.scopus.com/inward/record.url?eid=2-s2.0-84893376812&partnerID=MN8TOARS},   author = {Sarmento, H. and Pereira, A. and Campaniço, J. and Anguera, M.T. and Leitão, J.},   editor = {},   keywords = {}}', '2013-01-01', NULL, NULL, 'book', 0),
('cv-prod-id-21191', '@article{cv-prod-id-21191,  title = {Correlates Of Physical Fitness Among Secondary School Students},   journal = {Medicine and Science in Sports and Exercise},   volume = {44},   number = {},   pages = {657--657},   year = {2012},   url = {http://gateway.webofknowledge.com/gateway/Gateway.cgi?GWVersion=2&SrcAuth=ORCID&SrcApp=OrcidOrg&DestLinkType=FullRecord&DestApp=WOS_CPL&KeyUT=WOS:000310363303551&KeyUID=WOS:000310363303551},   author = {Marques, Adilson and Martins, Joao and Sarmento, Hugo and Diniz, Jose and da Costa, Francisco Carreiro and Marques, A. and Martins, J. and et al},   keywords = {}}', '2012-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21192', '@article{cv-prod-id-21192,  title = {Playing tactics in the English premier league, Spain\\\'s La Liga and Italy\\\'s Serie A (vol 45, pg A6, 2011)},   journal = {British Journal of Sports Medicine},   volume = {46},   number = {1},   pages = {78--78},   year = {2012},   url = {http://gateway.webofknowledge.com/gateway/Gateway.cgi?GWVersion=2&SrcAuth=ORCID&SrcApp=OrcidOrg&DestLinkType=FullRecord&DestApp=WOS_CPL&KeyUT=WOS:000299095000017&KeyUID=WOS:000299095000017},   author = {Sarmento, H. and Marques, A. and Martins, J. and Anguera, T. and Campanico, J. and Leitao, J.},   keywords = {}}', '2012-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21194', '@article{cv-prod-id-21194,  title = {Motivation In Soccer - A Comparison Between Professionals, Semi-professionals And Amateurs Soccer Players},   journal = {Medicine and Science in Sports and Exercise},   volume = {44},   number = {},   pages = {461--461},   year = {2012},   url = {http://gateway.webofknowledge.com/gateway/Gateway.cgi?GWVersion=2&SrcAuth=ORCID&SrcApp=OrcidOrg&DestLinkType=FullRecord&DestApp=WOS_CPL&KeyUT=WOS:000310363302666&KeyUID=WOS:000310363302666},   author = {Sarmento, H. M. and Marques, A. and Martins, J. F. and Catita, L. M. and Fonseca, A. M.},   keywords = {}}', '2012-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21195', '@book{cv-prod-id-21195,  title = {A observação da interação em contexto desportivo. In Sociedade Científica de Pedagogia do Desporto},   volume = {},   edition = {},   pages = {},   year = {2012},   publisher = {},   url = {},   author = {},   editor = {},   keywords = {}}', '2012-01-01', NULL, NULL, 'book', 0),
('cv-prod-id-21196', '@book{cv-prod-id-21196,  title = {Construção de instrumentos de observação: Apresentação de um exemplo no futebol.},   volume = {},   edition = {},   pages = {},   year = {2012},   publisher = {},   url = {},   author = {},   editor = {},   keywords = {}}', '2012-01-01', NULL, NULL, 'book', 0),
('cv-prod-id-21198', '@book{cv-prod-id-21198,  title = {A COMPARISON OF PLAYING TACTICS IN THE ENGLISH PREMIER LEAGUE, SPANISH LA LIGA AND ITALIAN SERIE A},   volume = {},   edition = {},   pages = {},   year = {2011},   publisher = {},   url = {http://gateway.webofknowledge.com/gateway/Gateway.cgi?GWVersion=2&SrcAuth=ORCID&SrcApp=OrcidOrg&DestLinkType=FullRecord&DestApp=WOS_CPL&KeyUT=WOS:000320409700152&KeyUID=WOS:000320409700152},   author = {Sarmento, H. M. and Campanico, J. M. and Anguera, M. T. and Leitao, J. C.},   editor = {Milanovic, D. and Sporis, G.},   keywords = {}}', '2011-01-01', NULL, NULL, 'book', 0),
('cv-prod-id-21200', '@article{cv-prod-id-21200,  title = {Development and validation of a notational system to study the offensive process in football.},   journal = {},   volume = {},   number = {},   pages = {},   year = {2010},   url = {http://europepmc.org/abstract/med/20944448},   author = {Sarmento H and Anguera T and Campaniço J and Leitão J},   keywords = {}}', '2010-00-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21201', '@article{cv-prod-id-21201,  title = {Development and validation of a notational system to study the offensive process in football | Nacionalines sistemos futbolo atakos procesams tirti sukurimas ir pritaikymas},   journal = {Medicina},   volume = {46},   number = {6},   pages = {401--407},   year = {2010},   url = {http://www.scopus.com/inward/record.url?eid=2-s2.0-77957166075&partnerID=MN8TOARS},   author = {Sarmento, H. and Anguera, T. and Campaniço, J. and Leitão, J.},   keywords = {}}', '2010-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21205', '@article{cv-prod-id-21205,  title = {SPORT MOTIVATION - A COMPARISON BETWEEN ADULT FOOTBALL PLAYERS COMPETING AT DIFFERENT LEVELS},   journal = {5th International Scientific Conference on Kinesiology, Proceedings Book},   volume = {},   number = {1},   pages = {631--634},   year = {2008},   url = {},   author = {Sarmento, Hugo and Catita, Luis and Fonseca, Antonio and Milanovic, D and Prot, F and Sarmento, Hugo Miguel Borges},   keywords = {}}', '2008-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21207', '@thesis{cv-prod-id-21207,  title = {Intergenerational tansmission of education : evidence from India},   school = {},   year = {2018},   month = {},   type = {Mestrado},   url = {http://hdl.handle.net/10400.14/25449},   author = {Sarmento, Teresa Maria Tavares Morais and Reis, Hugo Jorge Correia de Azambuja de Freitas},   keywords = {Intergenerational Mobility, Inequality, Education, Education Policy, Gender, Human Capital, India, Mobilidade Intergeracional, Desigualdade, Educação, Política Educativa, Género, Capital Humano, Índia, Domínio/Área Científica::Ciências Sociais::Economia e Gestão}}', '2018-01-01', NULL, NULL, 'dissertation', 0),
('cv-prod-id-21208', '@thesis{cv-prod-id-21208,  title = {Responding to new policy demands: a comparative study of Portuguese and Dutch non-university higher education organizations},   school = {},   year = {2018},   month = {},   type = {Doutoramento},   url = {http://hdl.handle.net/10071/16590},   author = {Hasanefendic, Sandra and sandrichko@gmail.com and Patrício, Maria Teresa de Morais Sarmento and Horta, Hugo Duarte Alves},   keywords = {Polytechics, Hogescholen, Non-university higher education, Policy demand, Research mandate, Innovation in education, Comparative, Política pública, Ensino superior, Ensino politécnico, Política de inovação, Inovação curricular, Gestão da mudança, Análise comparativa, Holanda, Portugal, Institutos politécnicos, Instituições de ensino superior não universitário, Mandato de investigação, Políticas públicas, Inovação dos serviços educativos, Formação, Comparação, Instituições, Organizações, Domínio do ensino superior nacional, Domínio/Área Científica::Ciências Sociais}}', '2018-01-01', NULL, NULL, 'dissertation', 0),
('cv-prod-id-21209', '@inproceedings{cv-prod-id-21209,  title = {Novel strategies for cancer treatment: drug delivery combining graphene quantum dots and core-filled lipid vesicles},   booktitle = {},   year = {2017},   pages = {},   publisher = {},   author = {Mendes, Rita and Soares, T. and Fernandes, Eduarda and Gonçalves, Hugo and Alves, Luis and Carvalho, Ana and Araújo, Francisca and et al},   keywords = {}}', '2017-01-01', 'Portugal', NULL, 'conference-paper', 0),
('cv-prod-id-21213', '@thesis{cv-prod-id-21213,  title = {Concetualização do Futsal: estudo de caso em grupos equipa de infantis masculinos na CLDE Viseu},   school = {},   year = {2017},   month = {},   type = {Mestrado},   url = {http://hdl.handle.net/10348/7767},   author = {Almeida, João Carlos Matos de and Sarmento, Hugo Miguel Borges and Duarte, Daniel Fernando Teixeira da Silva},   keywords = {Escola, Ensino, Modelos, Jogos desportivos coletivos, Metodologia, Organização estrutural, Organização funcional, Análise de conteúdo, 796.33(043), 371.38(043)}}', '2017-01-01', NULL, NULL, 'dissertation', 0),
('cv-prod-id-21214', '@article{cv-prod-id-21214,  title = {Identificação de padrões de atividade física e comportamentos sedentários em adolescentes, com recurso à avaliação momentânea ecológica},   journal = {Revista Portuguesa de Saúde Pública},   volume = {34},   number = {1},   pages = {38--45},   year = {2016},   url = {http://www.scielo.mec.pt/scielo.php?script=sci_arttext&pid=S0870-90252016000100006},   author = {Marques,Adilson and Peralta,Miguel and Martins,João and Sarmento,Hugo and Costa,Francisco Carreiro da and Marques, Adilson and Peralta, Miguel and et al},   keywords = {Adolescentes, Actividade física, Comportamentos sedentários, Promoção da saúde}}', '2016-01-01', 'Portugal', NULL, 'journal-article', 0),
('cv-prod-id-21222', '@thesis{cv-prod-id-21222,  title = {Desporto escolar: representações dos coordenadores locais das zonas da Guarda e de Viseu},   school = {},   year = {2016},   month = {},   type = {Mestrado},   url = {http://hdl.handle.net/10348/6369},   author = {Sousa, Carlos Agostinho Bernardo and Sarmento, Hugo Miguel Borges},   keywords = {Desporto escolar, Perceção, Formação contínua, 796(043), 371.38(043)}}', '2016-01-01', NULL, NULL, 'dissertation', 0),
('cv-prod-id-21223', '@thesis{cv-prod-id-21223,  title = {Desporto escolar: estudo comparativo entre as representações dos professores de educação física e dos coordenadores regionais/locais},   school = {},   year = {2016},   month = {},   type = {Mestrado},   url = {http://hdl.handle.net/10348/6798},   author = {Silva, António Nascimento Almeida and Sarmento, Hugo Miguel Borges},   keywords = {Desporto escolar, Escola, 796(043), Coordenação, 371(043)}}', '2016-01-01', NULL, NULL, 'dissertation', 0),
('cv-prod-id-21224', '@thesis{cv-prod-id-21224,  title = {O ensino e a aprendizagem em Educação Física: a influência de três estratégias de ensino diferenciadas na aquisição motora e na retenção de habilidades técnicas na modalidade voleibol},   school = {},   year = {2016},   month = {},   type = {Mestrado},   url = {http://hdl.handle.net/10348/5403},   author = {Caetano, Ricardo Jorge Bastos and Sarmento, Hugo Miguel Borges},   keywords = {Educação física, Voleibol, Habilidade motora, Estilos de ensino, 371.38(043), 796.32.012(043)}}', '2016-01-01', NULL, NULL, 'dissertation', 0),
('cv-prod-id-21225', '@thesis{cv-prod-id-21225,  title = {Metodologia observacional no handebol: análise às ações ofensivas da Seleção Campeã do Mundo 2011},   school = {},   year = {2016},   month = {},   type = {Mestrado},   url = {http://hdl.handle.net/10348/6023},   author = {Azeredo, Thiago Moraes Pereira de and Campaniço, Jorge Manuel Gomes and Sarmento, Hugo Miguel Borges},   keywords = {Metodologia observacional, Andebol, Processo ofensivo, 796.32.05(043)}}', '2016-01-01', NULL, NULL, 'dissertation', 0),
('cv-prod-id-21226', '@inproceedings{cv-prod-id-21226,  title = {VARRA: Validação,},   booktitle = {},   year = {2015},   pages = {},   publisher = {Mercado de Letras. Campinas,},   author = {Freitas, Cláudia and Santos, Diana and Gonçalo Oliveira, Hugo and Quental, Violeta and Ibaños, Ana Maria T. and Mottin, Livia Pretto and Sardinha, Tony Berber and Sarmento, Simone},   keywords = {PAPEL, ACDC}}', '2015-01-01', 'Portugal', NULL, 'conference-paper', 0),
('cv-prod-id-21232', '@thesis{cv-prod-id-21232,  title = {Determinants of corporate credit defaults in a portuguese bank},   school = {},   year = {2015},   month = {},   type = {Mestrado},   url = {http://hdl.handle.net/10400.5/10673},   author = {Santos, Hugo Miguel Bio and Sarmento, Joaquim},   keywords = {Empresas, Crédito, Incumprimento, Crise, Corporate, Credit, Default, Firms, Crisis}}', '2015-01-01', NULL, NULL, 'dissertation', 0),
('cv-prod-id-21233', '@thesis{cv-prod-id-21233,  title = {\\\"Participação, um Caminho para a Mudança\\\" Projeto desenvolvido com pessoas com doença renal crónica e cuidadores},   school = {},   year = {2015},   month = {},   type = {Mestrado},   url = {http://hdl.handle.net/10400.22/8181},   author = {Sarmento, Cristiana Andreia Monteiro Aguiar Esteves and Araújo, Deolinda and Monteiro, Hugo},   keywords = {Doença renal crónica, Hemodiálise, Empoderamento, Literacia em saúde., Chronic kidney disease, Hemodialysis, Empowerment, Health literacy, Domínio/Área Científica::Ciências Sociais::Ciências da Educação}}', '2015-01-01', NULL, NULL, 'dissertation', 0),
('cv-prod-id-21234', '@thesis{cv-prod-id-21234,  title = {Public–Private Partnerships : the case of a local Public-Private Partnership in Braga},   school = {},   year = {2015},   month = {},   type = {Mestrado},   url = {http://hdl.handle.net/10400.14/19997},   author = {Pires, Hugo André Cardoso Manuel and Reis, Ricardo and Sarmento, Joaquim Miranda},   keywords = {Domínio/Área Científica::Ciências Sociais::Economia e Gestão}}', '2015-01-01', NULL, NULL, 'dissertation', 0),
('cv-prod-id-21238', '@thesis{cv-prod-id-21238,  title = {Sistema de Produção de Energia Térmica de um Centro Comercial - Avaliação Económica e Impacto na Eficiência e Classe Energética (RSECE vs. RECS)},   school = {},   year = {2014},   month = {},   type = {Mestrado},   url = {http://hdl.handle.net/10400.22/10753},   author = {Sousa, Hugo Filipe da Silva and Pereira, Isabel Maria Garcia Sarmento},   keywords = {AVAC, Energia, TRACE, Climatização, RSECE, RECS, Arrefecimento, Aquecimento, Ventilação, Consumo, Eficiência, HVAC, Energy, Cooling, Heating, Ventilation, Utilities, Consumption, Efficiency}}', '2014-01-01', NULL, NULL, 'dissertation', 0),
('cv-prod-id-21239', '@thesis{cv-prod-id-21239,  title = {Análise do jogo de futebol: Padrões de jogo ofensivo em equipas de alto rendimento: uma abordagem qualitativa},   school = {},   year = {2012},   month = {},   type = {Doutoramento},   url = {http://hdl.handle.net/10348/2382},   author = {Sarmento, Hugo Miguel Borges and Leitão, José Carlos Gomes and Campaniço, Jorge Manuel Gomes and Argilaga, Maria Teresa Anguera},   keywords = {Soccer, Metodologia Observacional, Análise Sequencial, Padrões de Jogo, Análise de Conteúdo}}', '2012-01-01', NULL, NULL, 'dissertation', 0),
('cv-prod-id-21240', '@thesis{cv-prod-id-21240,  title = {Objectivos de realização, autonomia percebida e crenças sobre a competência desportiva: um estudo realizado com futebolistas portugueses},   school = {},   year = {2007},   month = {},   type = {Mestrado},   url = {http://hdl.handle.net/10216/96319},   author = {Antonio Manuel Fonseca and Faculdade de Desporto},   keywords = {Outras ciências sociais, Other social sciences, Ciências sociais::Outras ciências sociais, Social sciences::Other social sciences}}', '2007-01-01', NULL, NULL, 'dissertation', 0),
('cv-prod-id-21241', '@thesis{cv-prod-id-21241,  title = {Nivel de stress dos alunos do 1º ano da Faculdade de Ciências do Desporto e Educação Física da Universidade de Coimbra : um estudo descritivo},   school = {},   year = {2004},   month = {},   type = {Licenciatura},   url = {http://hdl.handle.net/10316/18476},   author = {Ramos, Susana},   keywords = {Stress, Bateria de testes, Coping, Estudantes de educação física, Psicologia do desporto}}', '2004-01-01', NULL, NULL, 'dissertation', 0),
('cv-prod-id-21242', '@article{cv-prod-id-21242,  title = {Football comparative analysis of fast attack beginnings between Real Madrid and Inter Milan},   journal = {Sport Mont – Journal of Sport, Physical Education and Health},   volume = {},   number = {40},   pages = {33--39},   year = {2014},   url = {},   author = {Barbosa, A. and Sarmento, Hugo Miguel Borges and Neto, José and Anguera, Maria Teresa and Campaniço, Jorge},   keywords = {}}', '2014-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21243', '@article{cv-prod-id-21243,  title = {Manchester United, Internazionale Milano and FC Barcelona – What´s Different?},   journal = {Sport Mont – Journal of Sport, Physical Education and Health},   volume = {},   number = {40},   pages = {50--56},   year = {2014},   url = {http://www.sportmont.ucg.ac.me/?sekcija=past_issues},   author = {Sarmento, Hugo Miguel Borges and Pereira, A. and Campaniço, Jorge and Anguera, Maria Teresa and Leitão, José Carlos},   keywords = {}}', '2014-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21244', '@article{cv-prod-id-21244,  title = {English Premier League, Spain\\\'s La Liga and Italy\\\'s Serie\\\'s A - What\\\'s Different?},   journal = {International Journal of Performance Analysis in Sport},   volume = {13},   number = {3},   pages = {773--789},   year = {2013},   url = {},   author = {Sarmento, H. and Pereira, A. and Matos, N. and Campanico, J. and Anguera, M. T. and Leitao, J.},   keywords = {}}', '2013-01-01', NULL, NULL, 'journal-article', 0);
INSERT INTO `publicacoes` (`idPublicacao`, `dados`, `data`, `pais`, `cidade`, `tipo`, `visivel`) VALUES
('cv-prod-id-21245', '@article{cv-prod-id-21245,  title = {Playing tactics in the English premier league, Spain\\\'s La Liga and Italy\\\'s Serie A (vol 45, pg A6, 2011)},   journal = {British Journal of Sports Medicine},   volume = {46},   number = {1},   pages = {78--78},   year = {2012},   url = {},   author = {Sarmento, H. and Marques, A. and Martins, J. and Anguera, T. and Campanico, J. and Leitao, J.},   keywords = {}}', '2012-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21246', '@inproceedings{cv-prod-id-21246,  title = {Desenvolvimento e validação de um instrumento de observação no futebol: OBSPD},   booktitle = {Atas do 3º Congresso de Jogos Desportivos Colectivos. Jogos Desportivos Colectivos: Treino, Formação, Performance},   year = {2011},   pages = {},   publisher = {},   author = {Martins, N. and Esteves, A. and Sarmento, Hugo Miguel Borges and Leitão, José Carlos and Campaniço, Jorge},   keywords = {}}', '2011-01-01', 'Portugal', NULL, 'conference-paper', 0),
('cv-prod-id-21247', '@inproceedings{cv-prod-id-21247,  title = {Detecção de T-patterns no comportamento do Guarda-Redes durante o processo defensivo},   booktitle = {Atas do 3º Congresso de Jogos Desportivos Colectivos. Jogos Desportivos Colectivos: Treino, Formação, Performance},   year = {2011},   pages = {},   publisher = {},   author = {Esteves, A. and Martins, N. and Sarmento, Hugo Miguel Borges and Leitão, José Carlos and Campaniço, Jorge},   keywords = {}}', '2011-01-01', 'Portugal', NULL, 'conference-paper', 0),
('cv-prod-id-21248', '@inproceedings{cv-prod-id-21248,  title = {Detecção de t-patterns no processo defensivo em futebol.},   booktitle = {Atas do 3º Congresso de Jogos Desportivos Colectivos. Jogos Desportivos Colectivos: Treino, Formação, Performance},   year = {2011},   pages = {},   publisher = {},   author = {Martins, N. and Esteves, A. and Sarmento, Hugo Miguel Borges and Leitão, José Carlos and Campaniço, Jorge},   keywords = {}}', '2011-01-01', 'Portugal', NULL, 'conference-paper', 0),
('cv-prod-id-21249', '@article{cv-prod-id-21249,  title = {Comparative analysis of the offensive game between Real Madrid 10/11 and 09/10 Inter Milan},   journal = {Scientific Report Physical Education and Sport },   volume = {15},   number = {1},   pages = {118--122},   year = {2011},   url = {},   author = {Barbosa, António and Sarmento, Hugo Miguel Borges and Anzano, A. and Campaniço, Jorge},   keywords = {}}', '2011-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21250', '@article{cv-prod-id-21250,  title = {Estudo de Padrões de Comportamento no Contra-Ataque de Equipas de Futebol de Rendimento Superior. },   journal = {Revista Portuguesa de Ciências do Desporto},   volume = {11},   number = {4},   pages = {88--88},   year = {2011},   url = {},   author = {Sarmento, Hugo Miguel Borges and Martins, N. and Esteves, A. and Anguera, Maria Teresa and Campaniço, Jorge and Leitão, José Carlos},   keywords = {}}', '2011-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21251', '@article{cv-prod-id-21251,  title = {T-pattern detection analysis: Defensive process in football},   journal = {},   volume = {},   number = {},   pages = {},   year = {2011},   author = {Martins, N. and Sarmento, Hugo Miguel Borges and Barbosa, António and Campaniço, Jorge and Leitão, José Carlos},   keywords = {}}', '2011-01-01', NULL, 'Liverpool', 'conference-abstract', 0),
('cv-prod-id-21252', '@article{cv-prod-id-21252,  title = {Development and validation of a notational system to study the offensive process in football | Nacionalines sistemos futbolo atakos procesams tirti sukurimas ir pritaikymas},   journal = {Medicina},   volume = {46},   number = {6},   pages = {401--407},   year = {2010},   url = {},   author = {Sarmento, H. and Anguera, T. and Campaniço, J. and Leitão, J.},   keywords = {}}', '2010-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21253', '@article{cv-prod-id-21253,  title = {Construção de instrumentos de observação: Apresentação de um exemplo no futebol},   journal = {},   volume = {},   number = {},   pages = {},   year = {2010},   author = {Martins, N. and Sarmento, Hugo Miguel Borges and Campaniço, Jorge and Leitão, José Carlos},   keywords = {}}', '2010-01-01', NULL, 'Tomar', 'conference-abstract', 0),
('cv-prod-id-21254', '@article{cv-prod-id-21254,  title = {Achievement Goals, Self-Determination and Beliefs about the Nature and Determinants of Sport Competence - An Age-group comparison between male football players},   journal = {13th Annual Congress of the European College of Sport Science},   volume = {},   number = {},   pages = {},   year = {2008},   author = {Sarmento, Hugo Miguel Borges and Catita, Luís and Fonseca, António},   keywords = {}}', '2008-01-01', 'Portugal', 'Lisboa', 'conference-abstract', 0),
('cv-prod-id-21255', '@article{cv-prod-id-21255,  title = {Representations, stimulus and constraints of the football 11 referee | Representações, estímulos e constrangimentos do árbitro de fu-tebol de 11},   journal = {Motricidade},   volume = {11},   number = {4},   pages = {15--25},   year = {2015},   url = {http://www.scopus.com/inward/record.url?eid=2-s2.0-84962258730&partnerID=MN8TOARS},   author = {Sarmento, H.M. and Marques, A. and Pereira, A.},   keywords = {}}', '2015-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21256', '@article{cv-prod-id-21256,  title = {Observational methodology in football: Development of an instrument to study the offensive game in football},   journal = {Motricidade},   volume = {5},   number = {3},   pages = {19--24},   year = {2009},   url = {},   author = {Sarmento, H. and Leitão, J. and Anguera, T. and Campaniço, J.},   keywords = {}}', '2009-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-21257', '@article{cv-prod-id-21257,  title = {Observational methodology in football: Development of an instrument to study the offensive game in football},   journal = {Motricidade},   volume = {5},   number = {3},   pages = {19--24},   year = {2009},   url = {http://gateway.webofknowledge.com/gateway/Gateway.cgi?GWVersion=2&SrcAuth=ORCID&SrcApp=OrcidOrg&DestLinkType=FullRecord&DestApp=SCIELO&KeyUT=SCIELO:S1646-107X2009000300005&KeyUID=SCIELO:S1646-107X2009000300005},   author = {Sarmento, H. and Leitão, J. and Anguera, T. and Campaniço, J.},   keywords = {}}', '2009-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-24522', '@article{cv-prod-id-24522,  title = {Adolescent characteristics of youth soccer players: do they vary with playing status in young adulthood?},   journal = {Research in Sports Medicine},   volume = {},   number = {},   pages = {},   year = {2019},   url = {https://doi.org/10.1080/15438627.2019.1586704},   author = {António J. Figueiredo and Manuel J. Coelho-E-Silva and Hugo Sarmento and José Moya and Robert M. Malina},   keywords = {}}', '2019-03-06', NULL, NULL, 'journal-article', 0),
('cv-prod-id-24984', '@article{cv-prod-id-24984,  title = {Ateísmo marxista: componente filosófica ou metodológica?},   journal = {Revista Portuguesa de Filosofia},   volume = {32},   number = {3/4 },   pages = {251--280},   year = {1976},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   keywords = {}}', '1976-01-01', 'Portugal', 'Braga', 'journal-article', 0),
('cv-prod-id-24985', '@article{cv-prod-id-24985,  title = {A Verdade em Kierkeggard},   journal = {Revista Portuguesa de Filosofia},   volume = {33},   number = {1},   pages = {84--88},   year = {1977},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   keywords = {}}', '1977-01-01', 'Portugal', 'Braga', 'journal-article', 0),
('cv-prod-id-24986', '@article{cv-prod-id-24986,  title = {Filosofia do conhecimento lógico-matemático},   journal = {Revista Portuguesa de Filosofia, Suplemento Bibliográfico},   volume = {10},   number = {61/62},   pages = {157--163},   year = {1978},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   keywords = {}}', '1978-01-01', 'Portugal', 'Braga', 'journal-article', 0),
('cv-prod-id-24987', '@article{cv-prod-id-24987,  title = {O Aborto na dupla dimensão ético-jurídica},   journal = {Gil Vicente},   volume = {},   number = {1},   pages = {49--58},   year = {1980},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   keywords = {}}', '1980-01-01', 'Portugal', 'Guimarães', 'journal-article', 0),
('cv-prod-id-24988', '@article{cv-prod-id-24988,  title = {Reflexões sobre a Eutanásia},   journal = {Brotéria},   volume = {111},   number = {4},   pages = {285--291},   year = {1980},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   keywords = {}}', '1980-01-01', 'Portugal', 'Lisboa', 'journal-article', 0),
('cv-prod-id-24989', '@article{cv-prod-id-24989,  title = {Eutanásia e Distanásia},   journal = {Acção Médica},   volume = {},   number = {3},   pages = {165--172},   year = {1980},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   keywords = {}}', '1980-01-01', 'Portugal', 'Porto', 'journal-article', 0),
('cv-prod-id-24990', '@article{cv-prod-id-24990,  title = {O Trinómio Fé - Pecado - Amor na I Carta de S. João},   journal = {Theologica},   volume = {},   number = {I-II},   pages = {15--26},   year = {1980},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   keywords = {}}', '1980-01-01', 'Portugal', 'Braga', 'journal-article', 0),
('cv-prod-id-24991', '@article{cv-prod-id-24991,  title = {Morrer com dignidade: reflexão ética sobre as técnicas reanimativas},   journal = {Acção Médica},   volume = {},   number = {3},   pages = {180--185},   year = {1981},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   keywords = {}}', '1981-01-01', 'Portugal', 'Porto', 'journal-article', 0),
('cv-prod-id-24992', '@article{cv-prod-id-24992,  title = {Roger Geraudy ou o humanismo da ruptura histórica},   journal = {Revista Portuguesa de Filosofia},   volume = {},   number = {4},   pages = {732--741},   year = {1982},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   keywords = {}}', '1982-01-01', 'Portugal', 'Braga', 'journal-article', 0),
('cv-prod-id-24993', '@article{cv-prod-id-24993,  title = {Educação para uma verdadeira sexualidade humana},   journal = {Acção Médica},   volume = {},   number = {4},   pages = {220--225},   year = {1983},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   keywords = {}}', '1983-01-01', 'Portugal', NULL, 'journal-article', 0),
('cv-prod-id-24994', '@article{cv-prod-id-24994,  title = {Marxismo e Subjectividade: o contributo de Roger Garaudy},   journal = {Revista Portuguesa de Filosofia},   volume = {},   number = {1-2},   pages = {103--130},   year = {1984},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   keywords = {}}', '1984-01-01', 'Portugal', 'Braga', 'journal-article', 0),
('cv-prod-id-24995', '@article{cv-prod-id-24995,  title = {A Educação Sexual nas Escolas},   journal = {Brotéria},   volume = {},   number = {1},   pages = {51--60},   year = {1985},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   keywords = {}}', '1985-01-01', 'Portugal', 'Lisboa', 'journal-article', 0),
('cv-prod-id-24996', '@article{cv-prod-id-24996,  title = {Educação Sexual e Meios de Comunicação Social},   journal = {Acção Médica},   volume = {},   number = {1},   pages = {47--53},   year = {1986},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   keywords = {}}', '1986-01-01', 'Portugal', 'Porto', 'journal-article', 0),
('cv-prod-id-24997', '@article{cv-prod-id-24997,  title = {Juventude e Moralidade},   journal = {Brotéria},   volume = {},   number = {5-6},   pages = {566--572},   year = {1989},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   keywords = {}}', '1989-01-01', 'Portugal', 'Lisboa', 'journal-article', 0),
('cv-prod-id-24998', '@article{cv-prod-id-24998,  title = {O \\\"Bébé de Erlangen\\\" - Reflexão Ética},   journal = {Brotéria},   volume = {},   number = {136},   pages = {90--94},   year = {1993},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   keywords = {}}', '1993-01-01', 'Portugal', 'Lisboa', 'journal-article', 0),
('cv-prod-id-24999', '@article{cv-prod-id-24999,  title = {Filosofia do Futuro - Futuro da Filosofia},   journal = {Revista Portuguesa de Filosofia},   volume = {},   number = {1-3},   pages = {313--322},   year = {1994},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   keywords = {}}', '1994-01-01', 'Portugal', 'Braga', 'journal-article', 0),
('cv-prod-id-25000', '@article{cv-prod-id-25000,  title = {Deus - Religião - Igreja: que futuro?},   journal = {Revista Portuguesa de Filosofia},   volume = {},   number = {1},   pages = {209--222},   year = {1995},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   keywords = {}}', '1995-01-01', 'Portugal', 'Braga', 'journal-article', 0),
('cv-prod-id-25001', '@article{cv-prod-id-25001,  title = {Amor e morte: meditação antropológica},   journal = {Revista Portuguesa de Filosofia},   volume = {},   number = {1-4},   pages = {691--694},   year = {1996},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   keywords = {}}', '1996-01-01', 'Portugal', 'Braga', 'journal-article', 0),
('cv-prod-id-25002', '@article{cv-prod-id-25002,  title = {Violência e Condicionalismos à Vida Humana},   journal = {Memoria},   volume = {},   number = {9},   pages = {141--149},   year = {2002},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   keywords = {}}', '2002-01-01', 'Portugal', 'Viana do Castelo', 'journal-article', 0),
('cv-prod-id-25003', '@article{cv-prod-id-25003,  title = {O Testamento de Roger Garaudy},   journal = {Brotéria},   volume = {},   number = {157},   pages = {59--73},   year = {2003},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   keywords = {}}', '2003-01-01', 'Portugal', 'Lisboa', 'journal-article', 0),
('cv-prod-id-25004', '@article{cv-prod-id-25004,  title = {Pessoa e \\\"nova subjectividade\\\"},   journal = {Memoria},   volume = {},   number = {10},   pages = {45--56},   year = {2003},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   keywords = {}}', '2003-01-01', 'Portugal', 'Viana do Castelo', 'journal-article', 0),
('cv-prod-id-25005', '@article{cv-prod-id-25005,  title = {A Lei dos Transplantes: questões (im)pertinentes},   journal = {Brotéria},   volume = {},   number = {5-6},   pages = {451--459},   year = {2004},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   keywords = {}}', '2004-01-01', 'Portugal', 'Lisboa', 'journal-article', 0),
('cv-prod-id-25006', '@inbook{cv-prod-id-25006,  title = {Alguns Textos e Documentos de Particular Relevo Bioético},   booktitle = {Bioética},   volume = {},   edition = {},   pages = {387--401},   year = {1996},   publisher = {Editorial Verbo},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   editor = {},   keywords = {}}', '1996-01-01', 'Portugal', 'Lisboa', 'book-chapter', 0),
('cv-prod-id-25007', '@inbook{cv-prod-id-25007,  title = {A Filosofia Profética: uma perspectiva garaudiana},   booktitle = {Os longos Caminhos do Ser. Homenagem a Manuel Barbosa da Costa Freitas},   volume = {},   edition = {},   pages = {529--536},   year = {2003},   publisher = {Universidade Católica Portuguesa},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   editor = {},   keywords = {}}', '2003-01-01', 'Portugal', 'Lisboa', 'book-chapter', 0),
('cv-prod-id-25008', '@book{cv-prod-id-25008,  title = {Questões Actuais de Ética Médica},   volume = {1},   edition = {4},   pages = {350},   year = {1996},   publisher = {Editorial A.O.},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   editor = {},   keywords = {}}', '1996-01-01', 'Portugal', 'Braga', 'book', 0),
('cv-prod-id-25009', '@book{cv-prod-id-25009,  title = {Nova Aliança e Homem Novo},   volume = {1},   edition = {1},   pages = {230},   year = {1982},   publisher = {Editorial A.O.},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA and José Gonçalves Gama},   editor = {},   keywords = {}}', '1982-01-01', 'Portugal', 'Braga', 'book', 0),
('cv-prod-id-25010', '@book{cv-prod-id-25010,  title = {Ética e Política},   volume = {1},   edition = {1},   pages = {32},   year = {1982},   publisher = {Edições Conhecer},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   editor = {},   keywords = {}}', '1982-01-01', 'Portugal', 'Lisboa', 'book', 0),
('cv-prod-id-25011', '@book{cv-prod-id-25011,  title = {Novos em Cristo. Celebrações para Jovens},   volume = {1},   edition = {2},   pages = {166},   year = {1989},   publisher = {Editorial A.O.},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   editor = {},   keywords = {}}', '1989-01-01', 'Portugal', 'Braga', 'book', 0),
('cv-prod-id-25012', '@book{cv-prod-id-25012,  title = {A Manipulação Genética},   volume = {1},   edition = {1},   pages = {32},   year = {1985},   publisher = {Editorial A.O.},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   editor = {},   keywords = {}}', '1985-01-01', 'Portugal', 'Braga', 'book', 0),
('cv-prod-id-25013', '@book{cv-prod-id-25013,  title = {Orações do Mundo Novo},   volume = {1},   edition = {3},   pages = {80},   year = {2001},   publisher = {Editorial A.O.},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   editor = {},   keywords = {}}', '2001-01-01', 'Portugal', 'Braga', 'book', 0),
('cv-prod-id-25014', '@book{cv-prod-id-25014,  title = {Crescer Juntos. Reuniões para Jovens},   volume = {1},   edition = {1},   pages = {168},   year = {1990},   publisher = {Editorial A.O.},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   editor = {},   keywords = {}}', '1990-01-01', 'Portugal', 'Braga', 'book', 0),
('cv-prod-id-25015', '@book{cv-prod-id-25015,  title = {Campos de Férias para Jovens},   volume = {1},   edition = {1},   pages = {168},   year = {2001},   publisher = {Editorial A.O.},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   editor = {},   keywords = {}}', '2001-01-01', 'Portugal', 'Braga', 'book', 0),
('cv-prod-id-25016', '@book{cv-prod-id-25016,  title = {A Emergência da Subjectividade em Roger Garaudy},   volume = {1},   edition = {1},   pages = {282},   year = {2003},   publisher = {Faculdade de Filosofia},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   editor = {},   keywords = {}}', '2003-01-01', 'Portugal', 'Braga', 'book', 0),
('cv-prod-id-25017', '@book{cv-prod-id-25017,  title = {Bioética Para Todos},   volume = {1},   edition = {1},   pages = {230},   year = {2006},   publisher = {Editorial A.O.},   url = {},   author = {PINTO, JOSÉ RUI GAIA DA COSTA},   editor = {},   keywords = {}}', '2006-01-01', 'Portugal', 'Braga', 'book', 0),
('cv-prod-id-25018', '@inproceedings{cv-prod-id-25018,  title = {A Renovação Cristã da Sexologia},   booktitle = {El Humanismo y la Metafísica Cristiana en la Actualidad},   year = {1986},   pages = {206--217},   publisher = {Universidad Regiomontana},   author = {José R. Costa Pinto},   keywords = {}}', '1986-01-01', 'México', 'Monterrey', 'conference-paper', 0),
('cv-prod-id-25019', '@inproceedings{cv-prod-id-25019,  title = {Roger Garaudy ou o humanismo da ruptura histórica},   booktitle = { Actas do I Congresso Luso-Brasileiro de Filosofia - Revista Portuguesa de Filosofia},   year = {1982},   pages = {732--741},   publisher = {},   author = {José R. Costa Pinto},   keywords = {}}', '1982-01-01', 'Portugal', 'Braga', 'conference-paper', 0),
('cv-prod-id-25020', '@inproceedings{cv-prod-id-25020,  title = {Educação e Formação para uma Verdadeira Sexualidade Humana},   booktitle = {II Jornadas Nacionais de Planeamento Familiar},   year = {1982},   pages = {15--19},   publisher = {Instituto Pasteur},   author = {José R. Costa Pinto},   keywords = {}}', '1982-01-01', 'Portugal', 'Espinho', 'conference-paper', 0),
('cv-prod-id-25021', '@article{cv-prod-id-25021,  title = {As tecnologias: que custos e ganhos para o cuidar?},   journal = {III Jornadas de Enfermagem do Hospital P. Américo},   volume = {},   number = {},   pages = {87--89},   year = {1999},   author = {José R. Costa Pinto},   keywords = {}}', '1999-01-01', 'Portugal', 'Penafiel', 'conference-abstract', 0),
('cv-prod-id-25022', '@inproceedings{cv-prod-id-25022,  title = {Reprodução Humana Medicamente Assistida: Questões Ético-Legais},   booktitle = {1as Jornadas de Enfermagem Materno-Infantil},   year = {2001},   pages = {20--23},   publisher = {Centro Hospitalar de Vª Nª de Gaia},   author = {José R. Costa Pinto},   keywords = {}}', '2001-01-01', 'Portugal', 'Vila Nova de Gaia', 'conference-paper', 0),
('cv-prod-id-25023', '@inproceedings{cv-prod-id-25023,  title = {A Religião numa Era \\\"Pós-Cristã\\\"},   booktitle = {Religiosidade. O seu carácter irreprimível. Perspectivas contemporâneas},   year = {2010},   pages = {139--152},   publisher = {Ed. Aletheia},   author = {José R. Costa Pinto},   keywords = {}}', '2010-01-01', 'Portugal', 'Braga', 'conference-paper', 0),
('cv-prod-id-25024', '@article{cv-prod-id-25024,  title = {A medicina, serviço no amor},   journal = {Mensageiro do Coração de Jesus},   volume = {},   number = {},   pages = {361--364},   year = {1980},   url = {},   author = {José R. Costa Pinto},   editor = {},   keywords = {}}', '1980-08-09', 'Portugal', 'Braga', 'magazine-article', 0),
('cv-prod-id-25025', '@article{cv-prod-id-25025,  title = {Sentido cristão do repouso},   journal = {Mensageiro do Coração de Jesus},   volume = {},   number = {},   pages = {355--357},   year = {1981},   url = {},   author = {José R. Costa Pinto},   editor = {},   keywords = {}}', '1981-08-01', 'Portugal', 'Braga', 'magazine-article', 0),
('cv-prod-id-25026', '@article{cv-prod-id-25026,  title = {Desafio do Papa aos Jovens},   journal = {Mensageiro do Coração de Jesus},   volume = {},   number = {},   pages = {309--312},   year = {1982},   url = {},   author = {José R. Costa Pinto},   editor = {},   keywords = {}}', '1982-07-01', 'Portugal', 'Braga', 'magazine-article', 0),
('cv-prod-id-25027', '@article{cv-prod-id-25027,  title = {O fenómeno juventude},   journal = {Mensageiro do Coração de Jesus},   volume = {},   number = {},   pages = {13--14},   year = {1995},   url = {},   author = {José R. Costa Pinto},   editor = {},   keywords = {}}', '1995-01-01', 'Portugal', 'Braga', 'magazine-article', 0),
('cv-prod-id-25028', '@article{cv-prod-id-25028,  title = {Não tinha casa e acolheste-me...},   journal = {Mensageiro do Coração de Jesus},   volume = {},   number = {},   pages = {50--51},   year = {2002},   url = {},   author = {José R. Costa Pinto},   editor = {},   keywords = {}}', '2002-02-01', 'Portugal', 'Braga', 'magazine-article', 0),
('cv-prod-id-25029', '@article{cv-prod-id-25029,  title = {Profetas da vida},   journal = {Mensageiro do Coração de Jesus},   volume = {},   number = {},   pages = {7--8},   year = {2007},   url = {},   author = {José R. Costa Pinto},   editor = {},   keywords = {}}', '2007-01-01', 'Portugal', 'Braga', 'magazine-article', 0),
('cv-prod-id-25030', '@article{cv-prod-id-25030,  title = {Denúncias dos jovens, desafios aos jovens},   journal = {Mensageiro do Coração de Jesus},   volume = {},   number = {},   pages = {291--293},   year = {2008},   url = {},   author = {José R. Costa Pinto},   editor = {},   keywords = {}}', '2008-07-01', 'Portugal', 'Braga', 'magazine-article', 0),
('cv-prod-id-25031', '@article{cv-prod-id-25031,  title = {Humanizar os Hospitais},   journal = {Carta do Amigo},   volume = {},   number = {},   pages = {10--11},   year = {1980},   url = {},   author = {José R. Costa Pinto},   editor = {},   keywords = {}}', '1980-04-01', 'Portugal', 'Braga', 'magazine-article', 0),
('cv-prod-id-25032', '@article{cv-prod-id-25032,  title = {Comunicação Social e Verdade},   journal = {Diário do Minho},   volume = {},   number = {},   pages = {3--3},   year = {1980},   url = {},   author = {José R. Costa Pinto},   keywords = {}}', '1980-10-02', 'Portugal', NULL, 'newspapper-article', 0),
('cv-prod-id-25033', '@inproceedings{cv-prod-id-25033,  title = {A Analogia do Ser},   booktitle = {A Escola de Braga e a Formação Humanística. Tradição e Inovação},   year = {2010},   pages = {311--320},   publisher = {Zéfiro},   author = {José R. Costa Pinto},   keywords = {}}', '2010-01-01', 'Portugal', 'Braga', 'conference-paper', 0),
('cv-prod-id-25034', '@article{cv-prod-id-25034,  title = {Ciência e ética},   journal = {O Povo de Guimarães},   volume = {},   number = {},   pages = {15--15},   year = {2000},   url = {},   author = {José R. Costa Pinto},   keywords = {}}', '2000-06-30', 'Portugal', 'Guimarães', 'newspapper-article', 0),
('cv-prod-id-25035', '@article{cv-prod-id-25035,  title = {A Catequese de Jovens I},   journal = {Diário do Minho},   volume = {},   number = {},   pages = {9--9},   year = {1983},   url = {},   author = {José R. Costa Pinto},   keywords = {}}', '1983-11-10', 'Portugal', 'Braga', 'newspapper-article', 0),
('cv-prod-id-25036', '@article{cv-prod-id-25036,  title = {A Catequese de Jovens II},   journal = {Diário do Minho},   volume = {},   number = {},   pages = {9--9},   year = {1983},   url = {},   author = {José R. Costa Pinto},   keywords = {}}', '1983-11-17', 'Portugal', 'Braga', 'newspapper-article', 0),
('cv-prod-id-25037', '@article{cv-prod-id-25037,  title = {A Catequese de Jovens III},   journal = {Diário do Minho},   volume = {},   number = {},   pages = {9--9},   year = {1983},   url = {},   author = {José R. Costa Pinto},   keywords = {}}', '1983-12-01', 'Portugal', 'Braga', 'newspapper-article', 0),
('cv-prod-id-25038', '@article{cv-prod-id-25038,  title = {Catequese de Jovens IV},   journal = {Diário do Minho},   volume = {},   number = {},   pages = {9--9},   year = {1983},   url = {},   author = {José R. Costa Pinto},   keywords = {}}', '1983-12-15', 'Portugal', 'Braga', 'newspapper-article', 0),
('cv-prod-id-25039', '@article{cv-prod-id-25039,  title = {A revolução de Jesus},   journal = {Magnificat},   volume = {},   number = {},   pages = {63--65},   year = {1972},   url = {},   author = {José R. Costa Pinto},   editor = {},   keywords = {}}', '1972-11-04', 'Portugal', 'Braga', 'magazine-article', 0),
('cv-prod-id-25040', '@book{cv-prod-id-25040,  title = {Vem e Segue-Me},   volume = {},   edition = {1},   pages = {102},   year = {1985},   publisher = {Secretariado Nacional da Educação Cristã},   url = {},   author = {José R. Costa Pinto},   editor = {},   keywords = {}}', '1985-01-01', 'Portugal', 'Lisboa', 'book', 0),
('cv-prod-id-25041', '@book{cv-prod-id-25041,  title = {Jovens em Caminhada},   volume = {},   edition = {1},   pages = {236},   year = {2005},   publisher = {Fabigráfica},   url = {},   author = {José R. Costa Pinto},   editor = {},   keywords = {}}', '2005-01-01', 'Portugal', 'Braga', 'book', 0),
('cv-prod-id-25042', '@inproceedings{cv-prod-id-25042,  title = {Sexualidade e Pessoa},   booktitle = {Sexualidade e Educação para a Felicidade},   year = {2010},   pages = {197--207},   publisher = {Publicações da Faculdade de Filosofia},   author = {José R. Costa Pinto},   keywords = {}}', '2010-01-01', 'Portugal', 'Braga', 'conference-paper', 0),
('cv-prod-id-25043', '@article{cv-prod-id-25043,  title = {Giotto - no seu centenário},   journal = {Academia},   volume = {},   number = {},   pages = {52--53},   year = {1966},   url = {},   author = {José R. Costa Pinto},   editor = {},   keywords = {}}', '1966-12-04', 'Portugal', 'Braga', 'magazine-article', 0),
('cv-prod-id-25044', '@article{cv-prod-id-25044,  title = {A equação antropológica tem raiz teológica},   journal = {Círculo},   volume = {},   number = {},   pages = {3--4},   year = {1979},   url = {},   author = {José R. Costa Pinto},   editor = {},   keywords = {}}', '1979-03-04', 'Portugal', 'Braga', 'magazine-article', 0),
('cv-prod-id-25045', '@article{cv-prod-id-25045,  title = {A Filosofia da Religião: Percurso de Identidade},   journal = {Theologica},   volume = {45},   number = {2},   pages = {541--555},   year = {2010},   url = {},   author = {José R. Costa Pinto},   keywords = {}}', '2010-01-01', 'Portugal', 'Braga', 'journal-article', 0),
('cv-prod-id-25046', '@book{cv-prod-id-25046,  title = {Homens para a Paz},   volume = {1},   edition = {2},   pages = {48},   year = {1985},   publisher = {Apostolado da Oração},   url = {},   author = {José R. Costa Pinto},   editor = {},   keywords = {}}', '1985-01-01', 'Portugal', 'Braga', 'book', 0),
('cv-prod-id-25047', '@inbook{cv-prod-id-25047,  title = {Eutanásia: morrer com dignidade?},   booktitle = {Temas de Hoje, Temas de Sempre},   volume = {},   edition = {},   pages = {53--63},   year = {2012},   publisher = {APEFP},   url = {},   author = {José R. Costa Pinto},   editor = {},   keywords = {}}', '2012-01-01', 'Portugal', 'Braga', 'book-chapter', 0),
('cv-prod-id-25048', '@article{cv-prod-id-25048,  title = {Entrevista},   journal = {Diário do Minho - Igreja Viva},   volume = {},   number = {},   pages = {4--5},   year = {2014},   url = {},   author = {José R. Costa Pinto},   keywords = {}}', '2014-02-12', 'Portugal', 'Braga', 'newspapper-article', 0),
('cv-prod-id-25049', '@article{cv-prod-id-25049,  title = {Eutanásia: sim ou não?},   journal = {Diário do Minho - Igreja Viva},   volume = {},   number = {},   pages = {1--5},   year = {2016},   url = {},   author = {José R. Costa Pinto},   keywords = {}}', '2016-10-06', 'Portugal', 'Braga', 'newspapper-article', 0),
('cv-prod-id-25051', '@article{cv-prod-id-25051,  title = {Evocação do Prof. Doutor Bacelar e Oliveira, S.J. (1916-1999)},   journal = {Revista Portuguesa de Filosofia},   volume = {72},   number = {4},   pages = {1339--1348},   year = {2016},   url = {},   author = {José R. Costa Pinto},   keywords = {}}', '2016-01-01', 'Portugal', 'Braga', 'journal-article', 0),
('cv-prod-id-25052', '@article{cv-prod-id-25052,  title = {A Transcendência no percurso ideológico-existencial de Roger Garaudy},   journal = {Síntese - Revista de Filosofia},   volume = {44},   number = {140},   pages = {445--459},   year = {2017},   url = {},   author = {José R. Costa Pinto},   keywords = {}}', '2017-01-01', 'Brasil', 'Belo Horizonte - Brasil', 'journal-article', 0),
('cv-prod-id-25053', '@inbook{cv-prod-id-25053,  title = {A Religião numa era \\\\\\\"pós-cristã\\\\\\\"},   booktitle = {Religiosidade. O seu carácter irreprimível},   volume = {},   edition = {},   pages = {139--152},   year = {2010},   publisher = {Publicações da Faculdade de Filosofia},   url = {},   author = {José R. Costa Pinto},   editor = {},   keywords = {}}', '2010-01-01', 'Portugal', 'Braga', 'book-chapter', 0),
('cv-prod-id-25054', '@inbook{cv-prod-id-25054,  title = {Sexualidade e Pessoa},   booktitle = {Sexualidade e educação para a felicidade},   volume = {},   edition = {},   pages = {197--207},   year = {2010},   publisher = {Publicações da Faculdade de Filosofia},   url = {},   author = {José R. Costa Pinto},   editor = {},   keywords = {}}', '2010-01-01', 'Portugal', 'Braga', 'book-chapter', 0),
('cv-prod-id-25055', '@inbook{cv-prod-id-25055,  title = {A Analogia do Ser},   booktitle = {A Escola de Braga e a Formação Humanística. Tradição e Inovação},   volume = {},   edition = {},   pages = {311--320},   year = {2010},   publisher = {Zéfiro},   url = {},   author = {José R. Costa Pinto},   editor = {},   keywords = {}}', '2010-01-01', 'Portugal', 'Sintra', 'book-chapter', 0),
('cv-prod-id-25056', '@inbook{cv-prod-id-25056,  title = {Da pedagogia inaciana à ação transformadora do mundo},   booktitle = {A Pedagogia da Companhia de Jesus – Contributos para um Diálogo},   volume = {},   edition = {1},   pages = {355--370},   year = {2018},   publisher = {Axioma - Publicações da Faculdade de Filosofia},   url = {},   author = {Pinto, José Rui da Costa},   editor = {},   keywords = {}}', '2018-01-01', 'Portugal', 'Braga', 'book-chapter', 0),
('cv-prod-id-25057', '@article{cv-prod-id-25057,  title = {Relatório da Faculdade de Filosofia 1984-1985},   journal = {Revista Portuguesa de Filosofia},   volume = {},   number = {},   pages = {211--214},   year = {2018},   url = {},   author = {José R. Costa Pinto},   editor = {},   keywords = {}}', '2018-03-30', 'Portugal', 'Braga', 'magazine-article', 0),
('cv-prod-id-25058', '@inbook{cv-prod-id-25058,  title = {Faculdade de Filosofia de Braga},   booktitle = {História da Universidade Católica Portuguesa},   volume = {},   edition = {},   pages = {371--400},   year = {2018},   publisher = {Universidade Católica Portuguesa},   url = {},   author = {José R. Costa Pinto},   editor = {},   keywords = {}}', '2018-01-01', 'Portugal', 'Lisboa', 'book-chapter', 0),
('cv-prod-id-25059', '@article{cv-prod-id-25059,  title = {A TRANSCENDÊNCIA NO PERCURSO IDEOLÓGICO-EXISTENCIAL DE ROGER GARAUDY},   journal = {Síntese: Revista de Filosofia},   volume = {44},   number = {140},   pages = {445--445},   year = {2018},   url = {https://doi.org/10.20911%2F21769389v44n140p445%2F2017},   author = {Jose Rui da Costa Pinto},   keywords = {}}', '2018-01-02', NULL, NULL, 'journal-article', 0),
('cv-prod-id-25060', '@article{cv-prod-id-25060,  title = {Evocação do Prof. Doutor Bacelar e Oliveira, S.J.},   journal = {Revista Portuguesa de Filosofia},   volume = {72},   number = {4},   pages = {1339--1347},   year = {2016},   url = {https://doi.org/10.17990%2Frpf%2F2016_72_4_1339},   author = {José Rui da Costa Pinto},   keywords = {}}', '2016-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-25062', '@article{cv-prod-id-25062,  title = {Amor e morte — Meditação antropológica},   journal = {Revista Portuguesa de Filosofia},   volume = {52},   number = {1/4},   pages = {691--694},   year = {1996},   url = {http://www.jstor.org/stable/40419444},   author = {José Rui da Costa Pinto},   keywords = {}}', '1996-01-01', NULL, NULL, 'journal-article', 0),
('cv-prod-id-42270', '@inbook{cv-prod-id-42270,  title = {Biotecnologia marinha aplicada ao desenvolvimento de fármacos anticâncer},   booktitle = {},   volume = {},   edition = {},   pages = {},   year = {2022},   publisher = {},   url = {},   author = {FCCN, BogusOITO and FCCN, BogusQUATRO and Moreira, João},   editor = {},   keywords = {}}', '2022-01-01', NULL, NULL, 'book-chapter', 1),
('cv-prod-id-42273', '@inbook{cv-prod-id-42273,  title = {Utilização de testes de toxicidade para avaliação da qualidade de sedimentos portuários no Ceará (CE): Porto do Mucuripe. },   booktitle = {},   volume = {},   edition = {},   pages = {},   year = {2022},   publisher = {},   url = {},   author = {FCCN, BogusOITO and FCCN, BogusQUATRO and Moreira, João},   editor = {},   keywords = {}}', '2022-01-01', NULL, NULL, 'book-chapter', 1),
('cv-prod-id-42274', '@inbook{cv-prod-id-42274,  title = {Biotecnologia Marinha aplicada ao desenvolvimento de Fármacos Anticâncer a partir de Microrganismos Marinhos do Arquipélago de São Pedro e São Paulo. },   booktitle = {},   volume = {},   edition = {},   pages = {},   year = {2022},   publisher = {},   url = {},   author = {FCCN, BogusOITO and FCCN, BogusQUATRO and Moreira, João},   editor = {},   keywords = {}}', '2022-01-01', NULL, NULL, 'book-chapter', 1),
('cv-prod-id-42308', '@article{cv-prod-id-42308,  title = { Modulation of nitrate reductase activity by photosynthetic electron transport chain and nitric oxide balance in the red macroalga Gracilaria chilensis (Gracilariales, Rhodophyta)},   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusOITO and FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42309', '@article{cv-prod-id-42309,  title = { Response of Sargassum Beds (Fucales) to Human Trampling: Reproductive, Morphological, and Biochemical Aspects.},   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusOITO and FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42310', '@inproceedings{cv-prod-id-42310,  title = {Study of anticancer activity of chromomycins in breast tumor cells by modulation of the T-box factors.},   booktitle = {},   year = {2022},   author = {FCCN, BogusOITO and FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'conference-poster', 1),
('cv-prod-id-42311', '@article{cv-prod-id-42311,  title = {Polyketides produced by endophytic fungi isolated from Baccharis oxyodonta DC. (Asteraceae).},   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusOITO and FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42312', '@article{cv-prod-id-42312,  title = { Phenylhydroxamate Inhibitors Display Selective Cytotoxic Activity Against Leukemia.},   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusOITO and FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42313', '@inproceedings{cv-prod-id-42313,  title = {Pradimicin-IRD Induces Apoptosis in Colorectal Carcinoma Cell Line.},   booktitle = {},   year = {2022},   author = {FCCN, BogusOITO and FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'conference-poster', 1),
('cv-prod-id-42314', '@article{cv-prod-id-42314,  title = {Endophytic fungi induces apoptosis in breast tumor cells},   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusOITO and FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42315', '@article{cv-prod-id-42315,  title = {Effects of ultraviolet radiation (UVA+UVB) on young gametophytes of Gelidium floridanum: growth rate, photosynthetic pigments, carotenoids, photosynthetic performance, and ultrastructure.},   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusOITO and FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42316', '@article{cv-prod-id-42316,  title = {The brown seaweed Sargassum cymosum: changes in metabolism and cellular organization after long-term exposure to cadmium. },   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusOITO and FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42317', '@article{cv-prod-id-42317,  title = {Integrated multi-trophic farming system between the green seaweed Ulva lactuca, mussel, and fish: a production and bioremediation solution},   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusOITO and FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42318', '@article{cv-prod-id-42318,  title = { Environmental Stress Tolerance and Antioxidant Response of Palisada perforata (Rhodophyta) from a Tropical Reef },   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusOITO and FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42319', '@article{cv-prod-id-42319,  title = {Sargassum stenophyllum (Fucales, Ochrophyta) responses to temperature short term exposure: photosynthesis and chemical composition.},   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusOITO and FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42320', '@article{cv-prod-id-42320,  title = { Effects of drying processes on antioxidant properties and chemical constituents of four tropical macroalgae suitable as functional bioproducts. },   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusOITO and FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42321', '@article{cv-prod-id-42321,  title = {Antioxidant properties of different strains of Kappaphycus alvarezii (Rhodophyta) farmed on the Brazilian coast.},   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusOITO and FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42322', '@article{cv-prod-id-42322,  title = { Caffeine as a contaminant of periphyton: ecological changes and impacts on primary producers. },   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusOITO and FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42352', '@article{cv-prod-id-42352,  title = {Representations and the reduction theorem for ultragraph Leavitt path algebras.},   journal = {},   volume = {},   number = {},   pages = {},   year = {2023},   url = {},   author = {FCCN, BogusOITO and FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2023-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42354', '@article{cv-prod-id-42354,  title = { Chains in evolution algebras. Shadowing, finite order shifts and ultrametric spaces. },   journal = {},   volume = {},   number = {},   pages = {},   year = {2023},   url = {},   author = {FCCN, BogusOITO and FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2023-01-01', NULL, NULL, 'newspapper-article', 1),
('cv-prod-id-42356', '@book{cv-prod-id-42356,  title = {Squares and associative representations of two-dimensional evolution algebras.},   series = {},   volume = {},   edition = {},   pages = {},   year = {2023},   publisher = {},   url = {},   author = {FCCN, BogusOITO and FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2023-01-01', NULL, NULL, 'manual', 1),
('cv-prod-id-42357', '@inproceedings{cv-prod-id-42357,  title = {KMS states and continuous orbit equivalence for ultragraph shift spaces with sinks.},   booktitle = {},   year = {2022},   pages = {},   publisher = {},   author = {FCCN, BogusOITO and FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'conference-paper', 1),
('cv-prod-id-42358', '@article{cv-prod-id-42358,  title = {Topological full groups of ultragraph groupoids as an isomorphism invariant.},   journal = {},   volume = {},   number = {},   pages = {},   year = {2023},   url = {},   author = {FCCN, BogusOITO and FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2023-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42366', '@article{cv-prod-id-42366,  title = {Inexact variable metric method for convex-constrained optimization problems},   journal = {},   volume = {},   number = {},   pages = {},   year = {2023},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2023-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42367', '@article{cv-prod-id-42367,  title = {Improving the sampling process in the interval Branch-and-Prune algorithm for the discretizable molecular distance geometry problem.},   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42368', '@article{cv-prod-id-42368,  title = {An inexact projected LM type algorithm for solving convex constrained nonlinear equations.},   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42369', '@article{cv-prod-id-42369,  title = {An integer programming approach for the search of discretization orders in distance geometry problems. },   journal = {},   volume = {},   number = {},   pages = {},   year = {2020},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2020-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42370', '@article{cv-prod-id-42370,  title = {Recent results on assigned and unassigned distance geometry with applications to protein molecules and nanostructures. },   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42371', '@article{cv-prod-id-42371,  title = {A fixed-point method for approximate projection onto the positive semidefinite cone.},   journal = {},   volume = {},   number = {},   pages = {},   year = {2020},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2020-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42372', '@article{cv-prod-id-42372,  title = {Recent advances on the interval distance geometry problem. },   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42373', '@article{cv-prod-id-42373,  title = {Assigned and unassigned distance geometry: applications to biological molecules and nanostructures.},   journal = {},   volume = {},   number = {},   pages = {},   year = {2020},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2020-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42396', '@article{cv-prod-id-42396,  title = {Neurally adjusted ventilatory assist vs. pressure support to deliver protective mechanical ventilation in patients with acute respiratory distress syndrome: a randomized crossover trial.},   journal = {Metereological Journal},   volume = {2},   number = {3},   pages = {968--971},   year = {2024},   url = {},   author = {FCCN, BogusOITO and Moreira, João},   keywords = {}}', '2024-01-01', 'Belgium', 'Bruxelas', 'journal-article', 1),
('cv-prod-id-42397', '@article{cv-prod-id-42397,  title = {A Modified 3D Ewald Summation for Slab Geometry at Constant Potential},   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusOITO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42398', '@article{cv-prod-id-42398,  title = {Freeze-drying of ovalbumin-loaded carboxymethyl chitosan nanocapsules: Impact of freezing and annealing procedures on physicochemical properties of the formulation during dried storage.},   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusOITO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42400', '@article{cv-prod-id-42400,  title = { Peri/epicellular protein disulfide isomerase-A1 acts as an upstream organizer of cytoskeletal mechanoadaptation in vascular smooth muscle cells.},   journal = {},   volume = {},   number = {},   pages = {},   year = {2023},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João and FCCN, BogusOITO},   keywords = {}}', '2023-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42401', '@article{cv-prod-id-42401,  title = {Transport cycle of lactose permease in a nonhomogeneous random walk model. },   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusOITO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42402', '@article{cv-prod-id-42402,  title = {Variations in water discharge at different temporal scales in a mud-prone alluvial succession: The Paleocene-Eocene of the Tremp-Graus Basin, Spain. },   journal = {},   volume = {},   number = {},   pages = {},   year = {2023},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2023-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42403', '@article{cv-prod-id-42403,  title = {First titanosaur dinosaur nesting site from the Late Cretaceous of Brazil.},   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42404', '@article{cv-prod-id-42404,  title = { Variations from dry to aquic conditions in vertisols (Esplugafreda Formation, Eastern Pyrenees, Spain): Implications for late paleocene climate change. },   journal = {},   volume = {},   number = {},   pages = {},   year = {2023},   url = {},   author = {Moreira, João and FCCN, BogusQUATRO},   keywords = {}}', '2023-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42405', '@article{cv-prod-id-42405,  title = {Editorial preface to special issue: Palaeosols in the sedimentary record: Implications for understanding the depositional processes, sedimentary architecture and the palaeoenvironment. },   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42406', '@article{cv-prod-id-42406,  title = {Early diagenetic calcite replacement of evaporites in playa lakes of the Quiricó Formation (Lower Cretaceous, SE Brazil). },   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1);
INSERT INTO `publicacoes` (`idPublicacao`, `dados`, `data`, `pais`, `cidade`, `tipo`, `visivel`) VALUES
('cv-prod-id-42407', '@article{cv-prod-id-42407,  title = {First Upper Cretaceous notosuchians (Crocodyliformes) from the Uberaba Formation (Bauru Group), southeastern Brazil: enhancing crocodyliform diversity.},   journal = {},   volume = {},   number = {},   pages = {},   year = {2021},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2021-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42409', '@article{cv-prod-id-42409,  title = { A Mesoproterozoic hybrid dry-wet aeolian system: Galho do Miguel Formation, SE Brazil. },   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42410', '@article{cv-prod-id-42410,  title = {Architecture of coarse-grained gravity flow deposits in a structurally confined submarine canyon (late Eocene Tokaren Conglomerate, Slovakia). },   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42411', '@article{cv-prod-id-42411,  title = {Mesoproterozoic erg and sand sheet system: Architecture and controlling factors (Galho do Miguel Formation, SE Brazil). },   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42421', '@article{cv-prod-id-42421,  title = {Morphology, accumulation and preservation of draa systems in a Precambrian erg (Galho do Miguel Formation, SE Brazil). },   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42422', '@article{cv-prod-id-42422,  title = {Sedimentology of a distributive fluvial system: The Serra da Galga Formation, a new lithostratigraphic unit (Upper Cretaceous, Bauru Basin, Brazil). },   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42423', '@article{cv-prod-id-42423,  title = {Landscape and depositional controls on palaeosols of a distributive fluvial system (Upper Cretaceous, Brazil).},   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42424', '@article{cv-prod-id-42424,  title = {Programa computacional para análise de imagens de sistema poroso de rochas sedimentares.},   journal = {},   volume = {},   number = {},   pages = {},   year = {2023},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2023-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42425', '@article{cv-prod-id-42425,  title = {A taphofacies model for coquina sedimentation in lakes (Lower Cretaceous, Morro do Chaves Formation, NE Brazil). },   journal = {},   volume = {},   number = {},   pages = {},   year = {2023},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2023-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42426', '@article{cv-prod-id-42426,  title = {Alternating coarse- and fine-grained sedimentation in Precambrian deep-water ramp (Apiúna Formation, SE of Brazil): Tectonic and climate control or sea level variations?. },   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42427', '@article{cv-prod-id-42427,  title = {Preservation of titanosaur egg clutches in Upper Cretaceous cumulative palaeosols (Los Llanos Formation, La Rioja, Argentina). },   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42428', '@article{cv-prod-id-42428,  title = {A new Late Cretaceous crocodyliform from the western margin of Gondwana (La Rioja Province, Argentina). },   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42429', '@article{cv-prod-id-42429,  title = {Intermontane eolian sand sheet development, Upper Tulum Valley, central-western Argentina.},   journal = {},   volume = {},   number = {},   pages = {},   year = {2020},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2020-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42430', '@article{cv-prod-id-42430,  title = {The plant record of the Dunarobba and Pietrafitta sites In the Plio-Pleistocene palaeoenvironmental context of Central Italy. },   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42431', '@article{cv-prod-id-42431,  title = {A prodeltaic system controlled by hyperpycnal flows and storm waves: reinterpretation of the Punta Negra Formation (Lower-Middle Devonian, Argentine Precordillera).},   journal = {},   volume = {},   number = {},   pages = {},   year = {2022},   url = {},   author = {FCCN, BogusQUATRO and Moreira, João},   keywords = {}}', '2022-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-42844', '@book{cv-prod-id-42844,  title = {TesteAssociação1},   volume = {},   edition = {},   pages = {},   year = {2024},   publisher = {},   url = {},   author = {FCCN, BogusOITO and FCCN, BogusSETE},   editor = {},   keywords = {}}', '2024-01-01', NULL, NULL, 'book', 1),
('cv-prod-id-42845', '@article{cv-prod-id-42845,  title = {Anti-HIV activity of methanolic and aqueous extracts of fifteen materials of beach-cast macroalgae: valorization of underused waste biomass},   journal = {Applied Phycology},   volume = {3},   number = {1},   pages = {236--246},   year = {2022},   url = {http://dx.doi.org/10.1080/26388081.2021.1986677},   author = {Ramos, Soraia and FCCN, BogusSETE and Moreira, JMM},   keywords = {}}', '2022-03-17', NULL, NULL, 'journal-article', 1),
('cv-prod-id-43002', '@article{cv-prod-id-43002,  title = {Processing of pre-impregnated thermoplastic towpreg reinforced by continuous glass fibre and recycled PET by pultrusion},   journal = {},   volume = {},   number = {},   pages = {},   year = {2020},   url = {},   author = {Asensio, M. and Marques, A. and Merino, J.C. and Pastor, J.M. and Esfandiari, Puria and Silva, João and Núñez, K.},   keywords = {Pultrusion, Thermoplastic resin, Recycled, Glass fibres}}', '2020-01-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-43004', '@article{cv-prod-id-43004,  title = {Professional Private Car Service in London},   journal = {},   volume = {},   number = {},   pages = {},   year = {2023},   url = {},   author = {Noble transfer and FCCN, BogusQUATRO and FCCN, BogusCINCO and Moreira, JMM},   keywords = {#airporttransferservice #Parisairporttransfer #Parischauffeur #ChauffeurParis #Parischauffeurservice #Pariscarservice #C}}', '2023-04-03', NULL, NULL, 'journal-article', 1),
('cv-prod-id-43008', '@article{cv-prod-id-43008,  title = {Temperature Distribution and Specific Absorption Rate inside a Child\\\'s Eyes from Mobile Phone},   journal = {Tehnicki vjesnik - Technical Gazette},   volume = {30},   number = {},   pages = {},   year = {2023},   url = {},   author = {Vladimir Stankovic and Andela Jevtic and FCCN, BogusQUATRO and FCCN, BogusCINCO and Moreira, JMM},   keywords = {General Engineering}}', '2023-04-15', NULL, NULL, 'journal-article', 1),
('cv-prod-id-43009', '@article{cv-prod-id-43009,  title = {Does personality predict traveling abroad as indicated by mobile phone data? The idea of the mobile personality revisited},   journal = {Journal of Research in Personality},   volume = {103},   number = {},   pages = {104355},   year = {2023},   url = {},   author = {Anu Realo and Siiri Silm and Margus Tiru and Jüri Allik and FCCN, BogusQUATRO and FCCN, BogusCINCO and Moreira, JMM},   keywords = {General Psychology, Social Psychology}}', '2023-04-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-44977', '@inbook{cv-prod-id-44977,  title = {Cells in modified iquantum groups of type AIII and related Schur algebras},   booktitle = {Journal of Algebra},   volume = {619},   edition = {},   pages = {707--743},   year = {2023},   publisher = {Elsevier BV},   url = {},   author = {Weideng Cui and FCCN, BogusCINCO and FCCN, BogusOITO},   editor = {},   keywords = {Algebra and Number Theory}}', '2023-01-01', NULL, NULL, 'book-chapter', 1),
('cv-prod-id-44978', '@review{cv-prod-id-44978,  title = {O livro do CIÊNCIAVITAE},   journal = {},   volume = {1},   number = {2},   pages = {72--401},   year = {2018},   publisher = {},   url = {www.cienciavitae.pt },   booktitle = {CIÊNCIAVITAE: a origem},   author = {FCCN, BogusOITO},   keywords = {}}', '2018-01-01', NULL, NULL, 'book-review', 1),
('cv-prod-id-44979', '@book{cv-prod-id-44979,  title = {Tradução WPML Wordpress},   booktitle = {},   volume = {},   edition = {},   pages = {},   year = {2020},   publisher = {Appris},   url = {},   author = {FCCN, BogusOITO},   keywords = {}}', '2020-01-01', 'Argentina', 'Buenos Aires', 'translation', 1),
('cv-prod-id-44980', '@online{cv-prod-id-44980,  title = {Website Lista de sugestões},   description = {},   year = {2023},   month = {},   url = {www.listadesugestõesCV.com.pt},   author = {FCCN, BogusOITO},   keywords = {}}', '2023-01-01', NULL, NULL, 'website', 1),
('cv-prod-id-44981', '@book{cv-prod-id-44981,  title = {Conto de ficção das Sugestões},   booktitle = {Livro },   year = {2023},   author = {FCCN, BogusOITO},   editor = {},   volume = {},   number = {},   publisher = {Appris},   pages = {1--10},   keywords = {}}', '2023-01-01', 'Germany', 'Frankfurt', 'short-fiction', 1),
('cv-prod-id-44982', '@music{cv-prod-id-44982,  title = {Podcast do PTCRIS},   year = {2023},   type = {Audio Recording},   booktitle = {Acústico PTCRIS },   author = {FCCN, BogusOITO},   publisher = {FCCN},   keywords = {}}', '2023-01-01', NULL, NULL, 'audio-recording', 1),
('cv-prod-id-44983', '@video{cv-prod-id-44983,  title = {Videoclipe do PTCRIS},   series = {},   director = {PLopes e RPereira},   author = {Cátia Laranjeira },   type = {Video},   publisher = {FCCN},   year = {2023},   keywords = {}}', '2023-01-01', NULL, NULL, 'video-recording', 1),
('cv-prod-id-44985', '@audio{cv-prod-id-44985,  title = {Lista de sugestões - Festa},   booktitle = {RealityShow do PTCRIS: A saga continua},   year = {2023},   author = {FCCN, BogusOITO},   publisher = {FCCN},   keywords = {}}', '2023-01-01', NULL, NULL, 'radio-tv-program', 1),
('cv-prod-id-44986', '@patent{cv-prod-id-44986,  title = {Algoritmo da lista de sugestões},   year = {2023},   number = {},   address = {Portugal},   author = {FCCN, BogusOITO},   keywords = {}}', '2023-01-01', 'Portugal', NULL, 'patent', 1),
('cv-prod-id-44996', '@software{cv-prod-id-44996,  title = {Software - Lista de sugestões  },   version = {2.0},   year = {2023},   type = {CIÊNCIAVITAE},   author = {FCCN, BogusOITO},   institution = {Fundacao de Computacao Cientifica Nacional},   keywords = {}}', '2023-01-01', NULL, NULL, 'software', 1),
('cv-prod-id-44997', '@inbook{cv-prod-id-44997,  title = {Teste sugestões 30},   booktitle = {},   volume = {},   edition = {},   pages = {},   year = {2019},   publisher = {},   url = {},   author = {FCCN, BogusDOIS and FCCN, BogusOITO and Moreira, JMM},   editor = {},   keywords = {}}', '2019-01-01', 'Germany', 'Frankfurt', 'book-chapter', 1),
('cv-prod-id-44998', '@music{cv-prod-id-44998,  title = {Teste sugestões 32},   year = {2023},   author = {FCCN, BogusDOIS and FCCN, BogusOITO and Moreira, JMM},   publisher = {},   keywords = {}}', '2023-01-01', NULL, NULL, 'musical-composition', 1),
('cv-prod-id-44999', '@music{cv-prod-id-44999,  title = {Teste sugestões 31},   year = {2023},   author = {FCCN, BogusDOIS and FCCN, BogusOITO and Moreira, JMM},   publisher = {},   keywords = {}}', '2023-01-01', NULL, NULL, 'musical-composition', 1),
('cv-prod-id-45001', '@article{cv-prod-id-45001,  title = {Teste sugestões 33},   volume = {},   journal = {},   address = {},   year = {2021},   url = {},   author = {FCCN, BogusDOIS and FCCN, BogusOITO and Moreira, JMM},   keywords = {}}', '2021-01-01', NULL, NULL, 'preprint', 1),
('cv-prod-id-45002', '@inreference{cv-prod-id-45002,  title = {Teste sugestões 35},   booktitle = {},   volume = {},   pages = {},   year = {2023},   url = {},   author = {FCCN, BogusDOIS and Moreira, JMM and FCCN, BogusOITO},   editor = {},   keywords = {}}', '2023-01-01', NULL, NULL, 'dictionary-entry', 1),
('cv-prod-id-45003', '@article{cv-prod-id-45003,  title = {As Aves como Grupo Bioindicador da Qualidade de Ambientes},   journal = {Aves do Brasil},   volume = {},   number = {},   pages = {},   year = {2020},   url = {https://www.todamateria.com.br/aves/},   author = {FCCN, BogusDOIS and Moreira, JMM and FCCN, BogusOITO},   keywords = {}}', '2020-04-06', NULL, NULL, 'newsletter-article', 1),
('cv-prod-id-45004', '@article{cv-prod-id-45004,  title = {A note on the regular ideals of Leavitt path algebras},   journal = {MathGraph },   volume = {},   number = {},   pages = {},   year = {2021},   url = {https://www.portalmath.pt/},   author = {FCCN, BogusOITO and Moreira, JMM and FCCN, BogusDOIS},   editor = {},   keywords = {}}', '2021-01-01', NULL, NULL, 'magazine-article', 1),
('cv-prod-id-45005', '@book{cv-prod-id-45005,  title = {O Inimigo do Rei Anarquismo y prensa en las relaciones iberoamericanas},   pages = {},   year = {2024},   publisher = {Appris},   author = {FCCN, BogusOITO and Moreira, JMM and FCCN, BogusDOIS},   keywords = {}}', '2024-01-01', NULL, NULL, 'exhibition-catalogue', 1),
('cv-prod-id-45006', '@report{cv-prod-id-45006,  title = {Os anarquistas e a sua proposta de uma pedagogia libertária},   volume = {},   year = {2019},   month = {},   url = {https://brasilescola.uol.com.br/historia},   author = {FCCN, BogusOITO and FCCN, BogusDOIS and Moreira, JMM},   keywords = {}}', '2019-01-01', NULL, NULL, 'working-paper', 1),
('cv-prod-id-45008', '@book{cv-prod-id-45008,  title = {Higher catalase activity supressed lipid peroxidation in clofibrate-treated red alga},   volume = {},   edition = {},   pages = {},   year = {2020},   publisher = {FCCN},   url = {},   author = {FCCN, BogusOITO and Moreira, JMM and FCCN, BogusDOIS},   editor = {},   keywords = {}}', '2020-01-01', 'Germany', 'Frankfurt', 'edited-book', 1),
('cv-prod-id-45009', '@periodical{cv-prod-id-45009,  title = {Fenol: Toxicidade e Biodegradação por Microalga},   journal = {Revista XP},   volume = {15},   number = {2},   pages = {},   year = {2021},   editor = {FCCN, BogusOITO and Moreira, JMM and FCCN, BogusDOIS},   url = {https://www.algaplus.pt/},   keywords = {}}', '2021-01-01', NULL, NULL, 'journal-issue', 1),
('cv-prod-id-45010', '@inreference{cv-prod-id-45010,  title = { Oscilação dos Níveis de Pigmentos e Micosporinas em Culturas com Limitação de Nutrientes. },   booktitle = { Society for Free Radical Research},   volume = {},   number = {},   pages = {},   year = {2023},   publisher = {FCCN},   url = {https://www.infopedia.pt/},   author = {FCCN, BogusOITO and Moreira, JMM and FCCN, BogusDOIS},   editor = {},   keywords = {}}', '2023-01-01', 'Germany', 'Frankfurt', 'encyclopedia-entry', 1),
('cv-prod-id-45012', '@incollection{cv-prod-id-45012,  title = {Oxidative status of human and rat pancreatic cells},   booktitle = {International Society for Free Radical Research},   volume = {},   edition = {},   pages = {1--250},   refereed = {true},   year = {2022},   address = {São Paulo, Brazil},   publisher = {Appris},   url = {http://www.sfrr.org/},   author = {FCCN, BogusOITO and FCCN, BogusDOIS and Moreira, JMM},   editor = {},   keywords = {}}', '2022-01-01', 'Brazil', 'São Paulo', 'preface-postface', 1),
('cv-prod-id-45013', '@incollection{cv-prod-id-45013,  title = { Atividade Antioxidante de Flavonóides de Lychnophora},   booktitle = {Baltic Sea Science},   volume = {},   edition = {},   pages = {20--235},   refereed = {false},   year = {2021},   address = {Rio de Janeiro, Brazil},   publisher = {São Paulo: Lura Editorial},   url = {https://www.infopedia.pt/livros-autores/livros/weyward},   author = {FCCN, BogusOITO and Moreira, JMM and FCCN, BogusDOIS},   editor = {},   keywords = {}}', '2021-01-01', 'Brazil', 'Rio de Janeiro', 'preface-postface', 1),
('cv-prod-id-45014', '@online{cv-prod-id-45014,  title = {Changes in antioxidant enzyme activities and malonaldehyde},   year = {2021},   month = {},   url = {https://academic.oup.com/aesa/article/108/2/193/62887},   author = {FCCN, BogusOITO and Moreira, JMM and FCCN, BogusDOIS},   keywords = {}}', '2021-01-01', NULL, NULL, 'online-resource', 1),
('cv-prod-id-45015', '@report{cv-prod-id-45015,  title = {Effects of polychlorinated bipheyls mixture aroclor 1254},   volume = {10},   pages = {15},   institution = {},   year = {2022},   author = {FCCN, BogusOITO and Moreira, JMM and FCCN, BogusDOIS},   url = {https://www.bing.com/search?pglt=41&q=.+Effects+of+polychlorinated+bipheyls+mixture+aroclor+1254&cvid=83ce5034eabe48a6ad6b12685c542a86&aqs=edge..69i57j69i11004.223j0j1&FORM=ANAB01&DAF0=1&PC=U531},   keywords = {}}', '2022-01-01', NULL, NULL, 'report', 1),
('cv-prod-id-45016', '@article{cv-prod-id-45016,  title = { Sesquiterpene Lactones Inhibit the Release of Superoxide Anion},   journal = {Meeting of the Brazilian Biochemical and Molecular Biology Society},   volume = {},   number = {},   pages = {},   year = {2022},   author = {FCCN, BogusOITO and Moreira, JMM and FCCN, BogusDOIS},   keywords = {}}', '2022-01-01', 'Brazil', 'São Paulo', 'conference-abstract', 1),
('cv-prod-id-45017', '@thesis{cv-prod-id-45017,  title = {Uso de Viridicatina e Veridicadiol como agentes destinados ao preparo de formulações cosméticas},   school = {Akmola Regional Universal Scientific Library Named after M Zhumbaev},   year = {2019},   month = {},   type = {Master},   url = {},   author = {},   keywords = {}}', '2019-01-01', 'Kazakhstan', 'Kokshetau', 'dissertation', 1),
('cv-prod-id-45018', '@thesis{cv-prod-id-45018,  title = {Processo de obtenc¸a~o de nanoparti´culas de prata e selénio },   school = {Centro de Física das Universidades do Minho e do Porto},   year = {2022},   month = {},   type = {PhD},   url = {},   author = {},   keywords = {}}', '2022-01-01', 'Portugal', 'Porto', 'dissertation', 1),
('cv-prod-id-45020', '@artwork{cv-prod-id-45020,  title = {Estudo mecanistico da bioluminescencia de fungos},   author = {FCCN, BogusOITO and Moreira, JMM and FCCN, BogusDOIS},   type = {Visual Artwork},   keywords = {}}', NULL, NULL, NULL, 'visual-artwork', 1),
('cv-prod-id-45022', '@misc{cv-prod-id-45022,  title = {Preparo de formulações cosméticas com atividade fotoprotetora },   year = {2020},   bookauthor = {Patrícia Pereira},   author = {},   organization = {Millenium Studio Dance},   keywords = {}}', '2020-01-01', NULL, NULL, 'choreography', 1),
('cv-prod-id-45023', '@misc{cv-prod-id-45023,  title = {Bioatividade de compostos algais},   year = {2022},   type = {Exhibition},   institution = {},   author = { and FCCN, BogusOITO},   venue = {},   keywords = {}}', '2022-01-01', NULL, NULL, 'artistic-exhibition', 1),
('cv-prod-id-45024', '@misc{cv-prod-id-45024,  title = {Modulação do Sistema de Assimilação de Nitrogênio da Cianobactéria},   type = {Exhibition},   year = {2022},   author = {},   venue = {},   keywords = {}}', '2022-01-01', NULL, NULL, 'curatorial-museum-exhibition', 1),
('cv-prod-id-45025', '@misc{cv-prod-id-45025,  year = {2020},   publisher = {Universidade de São Paulo},   author = {},   keywords = {}}', '2020-02-04', NULL, NULL, 'performance-art', 1),
('cv-prod-id-45026', '@music{cv-prod-id-45026,  title = { Aspectos do Metabolismo de Nitrato Redutase},   year = {2019},   type = {Conductor},   author = { and },   venue = {},   keywords = {}}', '2019-01-01', NULL, NULL, 'musical-performance', 1),
('cv-prod-id-45489', '@article{cv-prod-id-45489,  title = {Tuning the pea protein gel network to mimic the heterogenous microstructure of animal protein},   journal = {Food Hydrocolloids},   volume = {140},   number = {},   pages = {108611},   year = {2023},   url = {},   author = {FCCN, BogusQUATRO and FCCN, BogusCATORZE and FCCN, BogusOITO and FCCN, BogusNOVE and FCCN, BogusCINCO},   keywords = {General Chemical Engineering, General Chemistry, Food Science}}', '2023-07-01', NULL, NULL, 'journal-article', 1),
('cv-prod-id-45490', '@article{cv-prod-id-45490,  title = {Multi-objective optimization based grey relational analysis and investigation of using the waste animal fat biodiesel on the engine characteristics},   journal = {Fuel},   volume = {343},   number = {},   pages = {127950},   year = {2023},   url = {},   author = {FCCN, BogusQUATRO and FCCN, BogusNOVE and FCCN, BogusOITO and FCCN, BogusCATORZE and FCCN, BogusCINCO},   keywords = {Organic Chemistry, Energy Engineering and Power Technology, Fuel Technology, General Chemical Engineering}}', '2023-07-01', NULL, NULL, 'journal-article', 1);

-- --------------------------------------------------------

--
-- Table structure for table `publicacoes_investigadores`
--

CREATE TABLE `publicacoes_investigadores` (
  `publicacao` varchar(50) NOT NULL,
  `investigador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `publicacoes_investigadores`
--

INSERT INTO `publicacoes_investigadores` (`publicacao`, `investigador`) VALUES
('cv-prod-id-12303', 22),
('cv-prod-id-12304', 22),
('cv-prod-id-12305', 22),
('cv-prod-id-12306', 22),
('cv-prod-id-12307', 22),
('cv-prod-id-12308', 22),
('cv-prod-id-12309', 22),
('cv-prod-id-12310', 22),
('cv-prod-id-12311', 22),
('cv-prod-id-12312', 22),
('cv-prod-id-12313', 22),
('cv-prod-id-20981', 12),
('cv-prod-id-20982', 12),
('cv-prod-id-20983', 12),
('cv-prod-id-20984', 12),
('cv-prod-id-20985', 12),
('cv-prod-id-20986', 12),
('cv-prod-id-20987', 12),
('cv-prod-id-20988', 12),
('cv-prod-id-20989', 12),
('cv-prod-id-20990', 12),
('cv-prod-id-20991', 12),
('cv-prod-id-20992', 12),
('cv-prod-id-20993', 12),
('cv-prod-id-20995', 12),
('cv-prod-id-20996', 12),
('cv-prod-id-20998', 12),
('cv-prod-id-20999', 12),
('cv-prod-id-21000', 12),
('cv-prod-id-21001', 12),
('cv-prod-id-21002', 12),
('cv-prod-id-21003', 12),
('cv-prod-id-21004', 12),
('cv-prod-id-21005', 12),
('cv-prod-id-21006', 12),
('cv-prod-id-21007', 12),
('cv-prod-id-21008', 12),
('cv-prod-id-21009', 12),
('cv-prod-id-21010', 12),
('cv-prod-id-21011', 12),
('cv-prod-id-21013', 12),
('cv-prod-id-21014', 12),
('cv-prod-id-21015', 12),
('cv-prod-id-21016', 12),
('cv-prod-id-21018', 12),
('cv-prod-id-21019', 12),
('cv-prod-id-21020', 12),
('cv-prod-id-21021', 12),
('cv-prod-id-21025', 12),
('cv-prod-id-21026', 12),
('cv-prod-id-21027', 12),
('cv-prod-id-21028', 12),
('cv-prod-id-21029', 12),
('cv-prod-id-21030', 12),
('cv-prod-id-21031', 12),
('cv-prod-id-21032', 12),
('cv-prod-id-21033', 12),
('cv-prod-id-21034', 12),
('cv-prod-id-21035', 12),
('cv-prod-id-21036', 12),
('cv-prod-id-21037', 12),
('cv-prod-id-21038', 12),
('cv-prod-id-21039', 12),
('cv-prod-id-21040', 12),
('cv-prod-id-21041', 12),
('cv-prod-id-21043', 12),
('cv-prod-id-21044', 12),
('cv-prod-id-21045', 12),
('cv-prod-id-21046', 12),
('cv-prod-id-21048', 12),
('cv-prod-id-21049', 12),
('cv-prod-id-21051', 12),
('cv-prod-id-21052', 12),
('cv-prod-id-21053', 12),
('cv-prod-id-21054', 12),
('cv-prod-id-21055', 12),
('cv-prod-id-21056', 12),
('cv-prod-id-21059', 12),
('cv-prod-id-21061', 12),
('cv-prod-id-21062', 12),
('cv-prod-id-21064', 12),
('cv-prod-id-21066', 12),
('cv-prod-id-21068', 12),
('cv-prod-id-21069', 12),
('cv-prod-id-21070', 12),
('cv-prod-id-21071', 12),
('cv-prod-id-21072', 12),
('cv-prod-id-21073', 12),
('cv-prod-id-21074', 12),
('cv-prod-id-21075', 12),
('cv-prod-id-21076', 12),
('cv-prod-id-21077', 12),
('cv-prod-id-21078', 12),
('cv-prod-id-21079', 12),
('cv-prod-id-21080', 12),
('cv-prod-id-21081', 12),
('cv-prod-id-21082', 12),
('cv-prod-id-21083', 12),
('cv-prod-id-21084', 12),
('cv-prod-id-21085', 12),
('cv-prod-id-21087', 12),
('cv-prod-id-21088', 12),
('cv-prod-id-21089', 12),
('cv-prod-id-21091', 12),
('cv-prod-id-21093', 12),
('cv-prod-id-21094', 12),
('cv-prod-id-21097', 12),
('cv-prod-id-21098', 12),
('cv-prod-id-21099', 12),
('cv-prod-id-21103', 12),
('cv-prod-id-21104', 12),
('cv-prod-id-21105', 12),
('cv-prod-id-21106', 12),
('cv-prod-id-21107', 12),
('cv-prod-id-21108', 12),
('cv-prod-id-21109', 12),
('cv-prod-id-21110', 12),
('cv-prod-id-21111', 12),
('cv-prod-id-21112', 12),
('cv-prod-id-21113', 12),
('cv-prod-id-21114', 12),
('cv-prod-id-21115', 12),
('cv-prod-id-21116', 12),
('cv-prod-id-21119', 12),
('cv-prod-id-21121', 12),
('cv-prod-id-21127', 12),
('cv-prod-id-21128', 12),
('cv-prod-id-21130', 12),
('cv-prod-id-21135', 12),
('cv-prod-id-21136', 12),
('cv-prod-id-21137', 12),
('cv-prod-id-21140', 12),
('cv-prod-id-21141', 12),
('cv-prod-id-21142', 12),
('cv-prod-id-21143', 12),
('cv-prod-id-21144', 12),
('cv-prod-id-21145', 12),
('cv-prod-id-21146', 12),
('cv-prod-id-21147', 12),
('cv-prod-id-21148', 12),
('cv-prod-id-21149', 12),
('cv-prod-id-21150', 12),
('cv-prod-id-21152', 12),
('cv-prod-id-21154', 12),
('cv-prod-id-21155', 12),
('cv-prod-id-21156', 12),
('cv-prod-id-21160', 12),
('cv-prod-id-21161', 12),
('cv-prod-id-21162', 12),
('cv-prod-id-21163', 12),
('cv-prod-id-21167', 12),
('cv-prod-id-21169', 12),
('cv-prod-id-21170', 12),
('cv-prod-id-21173', 12),
('cv-prod-id-21176', 12),
('cv-prod-id-21178', 12),
('cv-prod-id-21179', 12),
('cv-prod-id-21180', 12),
('cv-prod-id-21181', 12),
('cv-prod-id-21182', 12),
('cv-prod-id-21188', 12),
('cv-prod-id-21191', 12),
('cv-prod-id-21192', 12),
('cv-prod-id-21194', 12),
('cv-prod-id-21195', 12),
('cv-prod-id-21196', 12),
('cv-prod-id-21198', 12),
('cv-prod-id-21200', 12),
('cv-prod-id-21201', 12),
('cv-prod-id-21205', 12),
('cv-prod-id-21207', 12),
('cv-prod-id-21208', 12),
('cv-prod-id-21209', 12),
('cv-prod-id-21213', 12),
('cv-prod-id-21214', 12),
('cv-prod-id-21222', 12),
('cv-prod-id-21223', 12),
('cv-prod-id-21224', 12),
('cv-prod-id-21225', 12),
('cv-prod-id-21226', 12),
('cv-prod-id-21232', 12),
('cv-prod-id-21233', 12),
('cv-prod-id-21234', 12),
('cv-prod-id-21238', 12),
('cv-prod-id-21239', 12),
('cv-prod-id-21240', 12),
('cv-prod-id-21241', 12),
('cv-prod-id-21242', 12),
('cv-prod-id-21243', 12),
('cv-prod-id-21244', 12),
('cv-prod-id-21245', 12),
('cv-prod-id-21246', 12),
('cv-prod-id-21247', 12),
('cv-prod-id-21248', 12),
('cv-prod-id-21249', 12),
('cv-prod-id-21250', 12),
('cv-prod-id-21251', 12),
('cv-prod-id-21252', 12),
('cv-prod-id-21253', 12),
('cv-prod-id-21254', 12),
('cv-prod-id-21255', 12),
('cv-prod-id-21256', 12),
('cv-prod-id-21257', 12),
('cv-prod-id-24522', 12),
('cv-prod-id-24984', 11),
('cv-prod-id-24985', 11),
('cv-prod-id-24986', 11),
('cv-prod-id-24987', 11),
('cv-prod-id-24988', 11),
('cv-prod-id-24989', 11),
('cv-prod-id-24990', 11),
('cv-prod-id-24991', 11),
('cv-prod-id-24992', 11),
('cv-prod-id-24993', 11),
('cv-prod-id-24994', 11),
('cv-prod-id-24995', 11),
('cv-prod-id-24996', 11),
('cv-prod-id-24997', 11),
('cv-prod-id-24998', 11),
('cv-prod-id-24999', 11),
('cv-prod-id-25000', 11),
('cv-prod-id-25001', 11),
('cv-prod-id-25002', 11),
('cv-prod-id-25003', 11),
('cv-prod-id-25004', 11),
('cv-prod-id-25005', 11),
('cv-prod-id-25006', 11),
('cv-prod-id-25007', 11),
('cv-prod-id-25008', 11),
('cv-prod-id-25009', 11),
('cv-prod-id-25010', 11),
('cv-prod-id-25011', 11),
('cv-prod-id-25012', 11),
('cv-prod-id-25013', 11),
('cv-prod-id-25014', 11),
('cv-prod-id-25015', 11),
('cv-prod-id-25016', 11),
('cv-prod-id-25017', 11),
('cv-prod-id-25018', 11),
('cv-prod-id-25019', 11),
('cv-prod-id-25020', 11),
('cv-prod-id-25021', 11),
('cv-prod-id-25022', 11),
('cv-prod-id-25023', 11),
('cv-prod-id-25024', 11),
('cv-prod-id-25025', 11),
('cv-prod-id-25026', 11),
('cv-prod-id-25027', 11),
('cv-prod-id-25028', 11),
('cv-prod-id-25029', 11),
('cv-prod-id-25030', 11),
('cv-prod-id-25031', 11),
('cv-prod-id-25032', 11),
('cv-prod-id-25033', 11),
('cv-prod-id-25034', 11),
('cv-prod-id-25035', 11),
('cv-prod-id-25036', 11),
('cv-prod-id-25037', 11),
('cv-prod-id-25038', 11),
('cv-prod-id-25039', 11),
('cv-prod-id-25040', 11),
('cv-prod-id-25041', 11),
('cv-prod-id-25042', 11),
('cv-prod-id-25043', 11),
('cv-prod-id-25044', 11),
('cv-prod-id-25045', 11),
('cv-prod-id-25046', 11),
('cv-prod-id-25047', 11),
('cv-prod-id-25048', 11),
('cv-prod-id-25049', 11),
('cv-prod-id-25051', 11),
('cv-prod-id-25052', 11),
('cv-prod-id-25053', 11),
('cv-prod-id-25054', 11),
('cv-prod-id-25055', 11),
('cv-prod-id-25056', 11),
('cv-prod-id-25057', 11),
('cv-prod-id-25058', 11),
('cv-prod-id-25059', 11),
('cv-prod-id-25060', 11),
('cv-prod-id-25062', 11),
('cv-prod-id-42270', 20),
('cv-prod-id-42273', 20),
('cv-prod-id-42274', 20),
('cv-prod-id-42308', 20),
('cv-prod-id-42309', 20),
('cv-prod-id-42310', 20),
('cv-prod-id-42311', 20),
('cv-prod-id-42312', 20),
('cv-prod-id-42313', 20),
('cv-prod-id-42314', 20),
('cv-prod-id-42315', 20),
('cv-prod-id-42316', 20),
('cv-prod-id-42317', 20),
('cv-prod-id-42318', 20),
('cv-prod-id-42319', 20),
('cv-prod-id-42320', 20),
('cv-prod-id-42321', 20),
('cv-prod-id-42322', 20),
('cv-prod-id-42352', 20),
('cv-prod-id-42354', 20),
('cv-prod-id-42356', 20),
('cv-prod-id-42357', 20),
('cv-prod-id-42358', 20),
('cv-prod-id-42366', 20),
('cv-prod-id-42367', 20),
('cv-prod-id-42368', 20),
('cv-prod-id-42369', 20),
('cv-prod-id-42370', 20),
('cv-prod-id-42371', 20),
('cv-prod-id-42372', 20),
('cv-prod-id-42373', 20),
('cv-prod-id-42396', 20),
('cv-prod-id-42397', 20),
('cv-prod-id-42398', 20),
('cv-prod-id-42400', 20),
('cv-prod-id-42401', 20),
('cv-prod-id-42402', 20),
('cv-prod-id-42403', 20),
('cv-prod-id-42404', 20),
('cv-prod-id-42405', 20),
('cv-prod-id-42406', 20),
('cv-prod-id-42407', 20),
('cv-prod-id-42409', 20),
('cv-prod-id-42410', 20),
('cv-prod-id-42411', 20),
('cv-prod-id-42421', 20),
('cv-prod-id-42422', 20),
('cv-prod-id-42423', 20),
('cv-prod-id-42424', 20),
('cv-prod-id-42425', 20),
('cv-prod-id-42426', 20),
('cv-prod-id-42427', 20),
('cv-prod-id-42428', 20),
('cv-prod-id-42429', 20),
('cv-prod-id-42430', 20),
('cv-prod-id-42431', 20),
('cv-prod-id-42844', 20),
('cv-prod-id-42845', 20),
('cv-prod-id-43002', 20),
('cv-prod-id-43004', 20),
('cv-prod-id-43008', 20),
('cv-prod-id-43009', 20),
('cv-prod-id-44977', 20),
('cv-prod-id-44978', 20),
('cv-prod-id-44979', 20),
('cv-prod-id-44980', 20),
('cv-prod-id-44981', 20),
('cv-prod-id-44982', 20),
('cv-prod-id-44983', 20),
('cv-prod-id-44985', 20),
('cv-prod-id-44986', 20),
('cv-prod-id-44996', 20),
('cv-prod-id-44997', 20),
('cv-prod-id-44998', 20),
('cv-prod-id-44999', 20),
('cv-prod-id-45001', 20),
('cv-prod-id-45002', 20),
('cv-prod-id-45003', 20),
('cv-prod-id-45004', 20),
('cv-prod-id-45005', 20),
('cv-prod-id-45006', 20),
('cv-prod-id-45008', 20),
('cv-prod-id-45009', 20),
('cv-prod-id-45010', 20),
('cv-prod-id-45012', 20),
('cv-prod-id-45013', 20),
('cv-prod-id-45014', 20),
('cv-prod-id-45015', 20),
('cv-prod-id-45016', 20),
('cv-prod-id-45017', 20),
('cv-prod-id-45018', 20),
('cv-prod-id-45020', 20),
('cv-prod-id-45022', 20),
('cv-prod-id-45023', 20),
('cv-prod-id-45024', 20),
('cv-prod-id-45025', 20),
('cv-prod-id-45026', 20),
('cv-prod-id-45489', 20),
('cv-prod-id-45490', 20);

-- --------------------------------------------------------

--
-- Table structure for table `publicacoes_tipos`
--

CREATE TABLE `publicacoes_tipos` (
  `valor_API` varchar(100) NOT NULL,
  `valor_site_pt` varchar(255) NOT NULL,
  `valor_site_en` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `publicacoes_tipos`
--

INSERT INTO `publicacoes_tipos` (`valor_API`, `valor_site_pt`, `valor_site_en`) VALUES
('artistic-exhibition', 'Outros', 'Others'),
('audio-recording', 'Outros', 'Others'),
('book', 'Autor/a ou coautor/a de obra completa/catálogo', 'Author or co-author of a complete work/catalog'),
('book-chapter', 'Capítulos em obras coletivas', 'Chapters in collective works'),
('book-review', 'Recensão', 'Book review'),
('choreography', 'Outros', 'Others'),
('conference-abstract', 'Outros', 'Others'),
('conference-paper', 'Artigos em Proceedings', 'Articles in Proceedings'),
('conference-poster', 'Outros', 'Others'),
('curatorial-museum-exhibition', 'Outros', 'Others'),
('dictionary-entry', 'Entrada em Enciclopédias e dicionários', 'Entry in encyclopedias and dictionaries'),
('dissertation', 'Formação avançada', 'Advanced training'),
('edited-book', 'Editor/a ou coeditor/a de obra multiautor', 'Editor or co-editor of a multi-author work'),
('encyclopedia-entry', 'Entrada em Enciclopédias e dicionários', 'Entry in encyclopedias and dictionaries'),
('exhibition-catalogue', 'Autor/a ou coautor/a de obra completa/catálogo', 'Author or co-author of a complete work/catalog'),
('journal-article', 'Artigos em revistas científicas/artísticas', 'Articles in scientific/artistic journals'),
('journal-issue', 'Artigos em revistas científicas/artísticas', 'Articles in scientific/artistic journals'),
('magazine-article', 'Outros', 'Others'),
('manual', 'Outros', 'Others'),
('musical-composition', 'Outros', 'Others'),
('musical-performance', 'Outros', 'Others'),
('newsletter-article', 'Outros', 'Others'),
('newspapper-article', 'Artigos de opinião publicados na imprensa', 'Opinion articles published in the press'),
('online-resource', 'Outros', 'Others'),
('patent', 'Patentes', 'Patents'),
('performance-art', 'Outros', 'Others'),
('preface-postface', 'Prefácio ou Posfácio', 'Preface or Postface'),
('preprint', 'Outros', 'Others'),
('radio-tv-program', 'Outros', 'Others'),
('report', 'Relatórios', 'Reports'),
('script', 'Outros', 'Others'),
('short-fiction', 'Outros', 'Others'),
('software', 'Software', 'Software'),
('translation', 'Traduções', 'Translations'),
('video-recording', 'Outros', 'Others'),
('visual-artwork', 'Outros', 'Others'),
('website', 'Outros', 'Others'),
('working-paper', 'Outros', 'Others');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admissoes`
--
ALTER TABLE `admissoes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `investigadores`
--
ALTER TABLE `investigadores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `investigadores_projetos`
--
ALTER TABLE `investigadores_projetos`
  ADD PRIMARY KEY (`investigadores_id`,`projetos_id`),
  ADD KEY `projetos_id` (`projetos_id`);

--
-- Indexes for table `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `noticias_administrador_ibfk_1` (`ultimo_editor`);

--
-- Indexes for table `oportunidades`
--
ALTER TABLE `oportunidades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oportunidades_administrador_ibfk_1` (`ultimo_editor`);

--
-- Indexes for table `projetos`
--
ALTER TABLE `projetos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `publicacoes`
--
ALTER TABLE `publicacoes`
  ADD PRIMARY KEY (`idPublicacao`),
  ADD KEY `publicacoes_fk_tipo` (`tipo`);

--
-- Indexes for table `publicacoes_investigadores`
--
ALTER TABLE `publicacoes_investigadores`
  ADD PRIMARY KEY (`publicacao`,`investigador`),
  ADD KEY `investigador` (`investigador`);

--
-- Indexes for table `publicacoes_tipos`
--
ALTER TABLE `publicacoes_tipos`
  ADD PRIMARY KEY (`valor_API`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `admissoes`
--
ALTER TABLE `admissoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `investigadores`
--
ALTER TABLE `investigadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oportunidades`
--
ALTER TABLE `oportunidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `projetos`
--
ALTER TABLE `projetos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `investigadores_projetos`
--
ALTER TABLE `investigadores_projetos`
  ADD CONSTRAINT `investigadores_projetos_ibfk_1` FOREIGN KEY (`investigadores_id`) REFERENCES `investigadores` (`id`),
  ADD CONSTRAINT `investigadores_projetos_ibfk_2` FOREIGN KEY (`projetos_id`) REFERENCES `projetos` (`id`);

--
-- Constraints for table `noticias`
--
ALTER TABLE `noticias`
  ADD CONSTRAINT `noticias_administrador_ibfk_1` FOREIGN KEY (`ultimo_editor`) REFERENCES `administradores` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `oportunidades`
--
ALTER TABLE `oportunidades`
  ADD CONSTRAINT `oportunidades_administrador_ibfk_1` FOREIGN KEY (`ultimo_editor`) REFERENCES `administradores` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `publicacoes`
--
ALTER TABLE `publicacoes`
  ADD CONSTRAINT `publicacoes_fk_tipo` FOREIGN KEY (`tipo`) REFERENCES `publicacoes_tipos` (`valor_API`);

--
-- Constraints for table `publicacoes_investigadores`
--
ALTER TABLE `publicacoes_investigadores`
  ADD CONSTRAINT `publicacoes_investigadores_ibfk_1` FOREIGN KEY (`publicacao`) REFERENCES `publicacoes` (`idPublicacao`) ON DELETE CASCADE,
  ADD CONSTRAINT `publicacoes_investigadores_ibfk_2` FOREIGN KEY (`investigador`) REFERENCES `investigadores` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
