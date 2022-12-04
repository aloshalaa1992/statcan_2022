CREATE TABLE `project_statcan`.`naics_21` (
  `code` INT  NULL,
  `en_label` VARCHAR(255) NULL,
  `fr_label` VARCHAR(225)  NULL
  #PRIMARY KEY (`code`) to allow for a null value as blank
  );

CREATE TABLE `project_statcan`.`prov` (
  `code` INT NOT NULL,
  `en_label` VARCHAR(255) NULL,
  `fr_label` VARCHAR(225)  NULL,
  PRIMARY KEY (`code`));

CREATE TABLE `project_statcan`.`educ` (
  `code` INT NOT  NULL,
  `en_label` VARCHAR(255) NULL,
  `fr_label` VARCHAR(225)  NULL,
  PRIMARY KEY (`code`));

CREATE TABLE `project_statcan`.`noc_40` (
  `code` INT   NULL,
  `en_label` VARCHAR(255) NULL,
  `fr_label` VARCHAR(225)  NULL
  #PRIMARY KEY (`code`) to allow for a null value
  );

CREATE TABLE `project_statcan`.`age_12` (
  `code` INT NOT  NULL,
  `en_label` VARCHAR(255) NULL,
  `fr_label` VARCHAR(225)  NULL,
  PRIMARY KEY (`code`));


INSERT INTO `project_statcan`.`naics_21`
(`code`,
`en_label`,
`fr_label`)
VALUES
(1,"Agriculture","Agriculture"),
(2,"Forestry and logging and support activities for forestry","Foresterie et exploitation forestière et activités de soutien à la foresterie"),
(3,"Fishing, hunting and trapping","Pêche, chasse et piégeage"),
(4,"Mining, quarrying, and oil and gas extraction","Extraction minière, exploitation en carrière, et extraction de pétrole et de gaz"),
(5,"Utilities","Services publics"),
(6,"Construction","Construction"),
(7,"Manufacturing - durable goods","Fabrication de biens durables"),
(8,"Manufacturing - non-durable goods","Fabrication de biens non durables"),
(9,"Wholesale trade","Commerce de gros"),
(10,"Retail trade","Commerce de détail"),
(11,"Transportation and warehousing","Transport et entreposage"),
(12,"Finance and insurance","Finances et assurances"),
(13,"Real estate and rental and leasing","Services immobiliers et services de location et de location à bail"),
(14,"Professional, scientific and technical services","Services professionnels, scientifiques et techniques"),
(15,"Business, building and other support services","Services aux entreprises, services relatifs aux bâtiments et autres services de soutien"),
(16,"Educational services","Services d'enseignement"),
(17,"Health care and social assistance","Soins de santé et assistance sociale"),
(18,"Information, culture and recreation","Information, culture et loisirs"),
(19,"Accommodation and food services","Hébergement et services de restauration"),
(20,"Other services (except public administration)","Autres services (sauf les administrations publiques)"),
(21,"Public administration","Administrations publiques"),
(NULL,"Not applicable","Indisponible");

INSERT INTO `project_statcan`.`prov`
(`code`,
`en_label`,
`fr_label`)
VALUES
(10,"Newfoundland and Labrador","Terre-Neuve-et-Labrador"),
(11,"Prince Edward Island","Île-du-Prince-Édouard"),
(12,"Nova Scotia","Nouvelle-Écosse"),
(13,"New Brunswick","Nouveau-Brunswick"),
(24,"Quebec","Québec"),
(35,"Ontario","Ontario"),
(46,"Manitoba","Manitoba"),
(47,"Saskatchewan","Saskatchewan"),
(48,"Alberta","Alberta"),
(59,"British Columbia","Colombie-Britannique");

INSERT INTO `project_statcan`.`educ`
(`code`,
`en_label`,
`fr_label`)
VALUES
(0,"0 to 8 years","0 à 8 années"),
(1,"Some high school","Études secondaires partielles"),
(2,"High school graduate","Études secondaires complétées"),
(3,"Some postsecondary","Études postsecondaires partielles"),
(4,"Postsecondary certificate or diploma","Diplôme ou certificat d'études postsecondaires"),
(5,"Bachelor's degree","Baccalauréat"),
(6,"Above bachelor's degree","Diplôme ou certificat universitaire supérieur au baccalauréat");


INSERT INTO `project_statcan`.`noc_40`
(`code`,
`en_label`,
`fr_label`)
VALUES
(01,"Senior management occupations","Cadres supérieurs"),
(02,"Specialized middle management occupations","Cadres intermédiaires spécialisés"),
(03,"Middle management occupations in retail and wholesale trade and customer services","Cadres intermédiaires dans le commerce de détail, de gros et des services à la clientèle"),
(04,"Middle management occupations in trades, transportation, production and utilities","Cadres intermédiaires des métiers, des transports, de la production et des services d'utilité publique"),
(05,"Professional occupations in business and finance","Personnel professionnel en gestion des affaires et en finance"),
(06,"Administrative and financial supervisors and administrative occupations","Personnel de supervision du travail administratif et financier et personnel administratif"),
(07,"Finance, insurance and related business administrative occupations","Personnel en finance, assurance et personnel assimilé en administration des affaires"),
(08,"Office support occupations","Personnel de soutien de bureau"),
(09,"Distribution, tracking and scheduling co-ordination occupations","Personnel de coordination de la distribution, du suivi et des horaires"),
(10,"Professional occupations in natural and applied sciences","Personnel professionnel des sciences naturelles et appliquées"),
(11,"Technical occupations related to natural and applied sciences","Personnel technique assimilé aux sciences naturelles et appliquées"),
(12,"Professional occupations in nursing","Personnel professionnel en soins infirmiers"),
(13,"Professional occupations in health (except nursing)","Personnel professionnel des soins de santé (sauf soins infirmiers)"),
(14,"Technical occupations in health","Personnel technique des soins de santé"),
(15,"Assisting occupations in support of health services","Personnel de soutien des services de santé"),
(16,"Professional occupations in education services","Personnel professionnel en services d'enseignement"),
(17,"Professional occupations in law and social, community and government services","Personnel professionnel du droit et des services gouvernementaux, sociaux et communautaires"),
(18,"Paraprofessional occupations in legal, social, community and education services","Personnel paraprofessionnel des services juridiques, sociaux, communautaires et de l'enseignement"),
(19,"Occupations in front-line public protection services","Personnel des services de protection publique de première ligne"),
(20,"Care providers and educational, legal and public protection support occupations","Dispensateurs de soins et personnel de soutien en enseignement, en droit et en protection publique"),
(21,"Professional occupations in art and culture","Personnel professionnel des arts et de la culture"),
(22,"Technical occupations in art, culture, recreation and sport","Personnel technique des arts, de la culture, des sports et des loisirs"),
(23,"Retail sales supervisors and specialized sales occupations","Personnel de supervision des ventes au détail et personnel des ventes spécialisées"),
(24,"Service supervisors and specialized service occupations","Personnel de supervision en services et personnel de services spécialisés"),
(25,"Sales representatives and salespersons - wholesale and retail trade","Représentants des ventes et vendeurs - commerce de gros et de détail"),
(26,"Service representatives and other customer and personal services occupations","Représentants de services et autre personnel de services à la clientèle et personnalisés"),
(27,"Sales support occupations","Personnel de soutien des ventes"),
(28,"Service support and other service occupations, n.e.c.","Personnel de soutien en service et autre personnel de service, n.c.a."),
(29,"Industrial, electrical and construction trades","Personnel des métiers de l'électricité, de la construction et des industries"),
(30,"Maintenance and equipment operation trades","Personnel des métiers d'entretien et d'opération d'équipement"),
(31,"Other installers, repairers and servicers and material handlers","Personnel d'installation, de réparation et d'entretien et manutentionnaires"),
(32,"Transport and heavy equipment operation and related maintenance occupations","Personnel en opération d'équipement de transport et de machinerie lourde et autre personnel assimilé à l'entretien"),
(33,"Trades helpers, construction labourers and related occupations","Personnel de soutien des métiers, manœuvres et aides d'entreprise en construction et autre personnel assimilé"),
(34,"Supervisors and technical occupations in natural resources, agriculture and related production","Superviseurs et métiers techniques dans les ressources naturelles, l'agriculture et la production connexe"),
(35,"Workers in natural resources, agriculture and related production","Personnel en ressources naturelles, en agriculture et en production connexe"),
(36,"Harvesting, landscaping and natural resources labourers","Manœuvres à la récolte, en aménagement paysager et en ressources naturelles"),
(37,"Processing, manufacturing and utilities supervisors and central control operators","Personnel de supervision dans la transformation, la fabrication et les services d'utilité publique et opérateurs de poste central de contrôle"),
(38,"Processing and manufacturing machine operators and related production workers","Opérateurs de machinerie reliée à la transformation et à la fabrication et autre personnel assimilé"),
(39,"Assemblers in manufacturing","Monteurs dans la fabrication"),
(40,"Labourers in processing, manufacturing and utilities","Manœuvres dans la transformation, la fabrication et les services d'utilité publique"),
(NULL,"Not applicable","Indisponible");


INSERT INTO `project_statcan`.`age_12`
(`code`,
`en_label`,
`fr_label`)
VALUES

(01,"15 to 19 years","15 à 19 ans"),
(02,"20 to 24 years","20 à 24 ans"),
(03,"25 to 29 years","25 à 29 ans"),
(04,"30 to 34 years","30 à 34 ans"),
(05,"35 to 39 years","35 à 39 ans"),
(06,"40 to 44 years","40 à 44 ans"),
(07,"45 to 49 years","45 à 49 ans"),
(08,"50 to 54 years","50 à 54 ans"),
(09,"55 to 59 years","55 à 59 ans"),
(10,"60 to 64 years","60 à 64 ans"),
(11,"65 to 69 years","65 à 69 ans"),
(12,"70 and over","70 et plus");



CREATE TABLE `combined_pub` (
  `SURVMNTH` int DEFAULT NULL,
  `LFSSTAT` varchar(255) DEFAULT NULL,
  `PROV` int DEFAULT NULL,
  `AGE_12` int DEFAULT NULL,
  `SEX` varchar(255) DEFAULT NULL,
  `EDUC` int DEFAULT NULL,
  `NAICS_21` float DEFAULT NULL,
  `NOC_10` float DEFAULT NULL,
  `NOC_40` float DEFAULT NULL,
  `COWMAIN` float DEFAULT NULL,
  `FTPTMAIN` varchar(255) DEFAULT NULL,
  `QUARTER` varchar(255) DEFAULT NULL,
  `VOLUNTARY_PT` tinyint DEFAULT NULL
)