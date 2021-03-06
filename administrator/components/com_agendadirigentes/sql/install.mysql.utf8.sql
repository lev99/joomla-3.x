#compromissos anteriores
DROP TABLE IF EXISTS `#__agendadirigentes_agendaalterada`;
CREATE TABLE `#__agendadirigentes_agendaalterada` (
  `id_dirigente` int(11) NOT NULL,
  `data` date NOT NULL,
  `qtd_alteracoes` int(4) NOT NULL DEFAULT '0',
  `data_alteracao` DATETIME NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_dirigente`,`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#tabela de dirigentes
DROP TABLE IF EXISTS `#__agendadirigentes_dirigentes`;
CREATE TABLE `#__agendadirigentes_dirigentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `cargo_id` int(11) NOT NULL,
  `state` TINYINT(3) NOT NULL DEFAULT '0',
  `interino` int(1) unsigned NOT NULL DEFAULT '0',
  `em_atividade` int(1) unsigned NOT NULL DEFAULT '0',
  `sexo` char(1) NOT NULL DEFAULT 'M',
  PRIMARY KEY (`id`),
  KEY `idx_cargo_id` (`cargo_id`),
  KEY `idx_em_atividade` (`em_atividade`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

#relacionamento dirigentes e eventos
DROP TABLE IF EXISTS `#__agendadirigentes_dirigentes_compromissos`;
CREATE TABLE `#__agendadirigentes_dirigentes_compromissos` (
  `dirigente_id` int(11) NOT NULL,
  `compromisso_id` int(11) NOT NULL,
  `owner` int(11) DEFAULT '0',
  `sobreposto` int(1) NOT NULL DEFAULT '0' COMMENT 'Compromissos sobrepostos não são exibidos porque uma autoridade convocou outra para reunião.',
  `sobreposto_por` int(11) NOT NULL DEFAULT '0' COMMENT 'ID do compromisso que causou a sobreposição',
  PRIMARY KEY (`dirigente_id`,`compromisso_id`),
  KEY `idx_owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#cargos de dirigentes
DROP TABLE IF EXISTS `#__agendadirigentes_cargos`;
CREATE TABLE `#__agendadirigentes_cargos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `name_f` VARCHAR(255) DEFAULT NULL,
  `catid` int(11) NOT NULL DEFAULT '0',
  `published` int(1) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `featured` INT(1) NOT NULL DEFAULT '0',
  `permitir_sobreposicao` INT(1) NOT NULL DEFAULT '1',
  `realizar_sobreposicao` CHAR(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_catid` (`catid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

#tabela principal de eventos, sera transformada em compromissos
DROP TABLE IF EXISTS `#__agendadirigentes_compromissos`;
CREATE TABLE `#__agendadirigentes_compromissos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT 0,
  `data_inicial` date DEFAULT '0000-00-00',
  `horario_inicio` time DEFAULT '00:00:00',
  `data_final` date DEFAULT '0000-00-00',
  `horario_fim` time DEFAULT '00:00:00',
  `dia_todo` int(1) unsigned DEFAULT 0,
  `local` varchar(255) DEFAULT NULL,
  `description` text,
  `participantes_externos` text,  
  `params` tinytext,
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT 0,
  `modified` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT 0,
  `checked_out` int(11) DEFAULT '0',
  `checked_out_time` datetime DEFAULT '0000-00-00 00:00:00',
  `featured` int(1) DEFAULT 0,
  `published_once` INT(1) DEFAULT 0,
  `language` char(7) DEFAULT NULL,
  `version` INTEGER DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_data_inicial` (`data_inicial`),
  KEY `idx_horario_inicio` (`horario_inicio`),
  KEY `idx_data_final` (`data_final`),
  KEY `idx_horario_fim` (`horario_fim`),
  KEY `idx_state` (`state`),
  KEY `idx_outros` (`dia_todo`, `featured`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;