<?php
/**
* @package PortalPadrao
* @subpackage com_agendadirigentes
*
* @copyright Copyright (C) 2005 - 2014 Joomla Calango. All rights reserved.
* @license GNU General Public License version 2 or later; see LICENSE.txt
*/
 
// impedir acesso direto ao arquivo
defined('_JEXEC') or die;
?>
<h1><?php echo $this->msg; ?></h1>
<h1><?php echo $this->item->title.(($this->item->local and $this->item->params->get('exibir_local'))
                                      ? (' ('.$this->item->local.')') : ''); ?>
</h1>