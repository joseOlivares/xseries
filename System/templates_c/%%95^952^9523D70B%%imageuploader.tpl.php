<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('block', 'style_block', 'editors/imageuploader.tpl', 25, false),array('modifier', 'escapeurl', 'editors/imageuploader.tpl', 33, false),)), $this); ?>
<?php if (! $this->_tpl_vars['Editor']->GetReadOnly()): ?>
    <?php if ($this->_tpl_vars['RenderText']): ?>
        <?php if ($this->_tpl_vars['Editor']->GetShowImage() && ! $this->_tpl_vars['HideImage'] && $this->_tpl_vars['Editor']->GetLink()): ?>
            <img src="<?php echo $this->_tpl_vars['Editor']->GetLink(); ?>
" style="max-width: 100%;<?php echo $this->_tpl_vars['Editor']->getInlineStyles(); ?>
">
        <?php endif; ?>

        <div style="margin: 1em 0;">
            <div class="btn-group" data-toggle-name="<?php echo $this->_tpl_vars['Editor']->GetName(); ?>
_action" data-toggle="buttons-radio">
                <button type="button" value="Keep" class="active btn btn-default" data-toggle="button"><?php echo $this->_tpl_vars['Captions']->GetMessageString('KeepImage'); ?>
</button>
                <button type="button" value="Remove" class="btn btn-default" data-toggle="button"><?php echo $this->_tpl_vars['Captions']->GetMessageString('RemoveImage'); ?>
</button>
                <button type="button" value="Replace" class="btn btn-default" data-toggle="button"><?php echo $this->_tpl_vars['Captions']->GetMessageString('ReplaceImage'); ?>
</button>
            </div>
        </div>
        <input type="hidden" name="<?php echo $this->_tpl_vars['Editor']->GetName(); ?>
_action" value="Keep" />

        <div class="file-upload-control">
            <input
                <?php if ($this->_tpl_vars['id']): ?>id="<?php echo $this->_tpl_vars['id']; ?>
"<?php endif; ?>
                <?php echo $this->_tpl_vars['Validators']['InputAttributes']; ?>

                <?php if ($this->_tpl_vars['Editor']->GetLink()): ?>data-has-file="true"<?php endif; ?>
                data-editor="<?php echo $this->_tpl_vars['Editor']->getEditorName(); ?>
"
                data-field-name="<?php echo $this->_tpl_vars['Editor']->GetName(); ?>
"
                type="file"
                name="<?php echo $this->_tpl_vars['Editor']->GetName(); ?>
_filename"
                <?php $this->_tag_stack[] = array('style_block', array()); $_block_repeat=true;smarty_block_style_block($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?> <?php echo $this->_tpl_vars['Editor']->GetCustomAttributes(); ?>
 <?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_style_block($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>>
        </div>
    <?php endif; ?>
<?php elseif ($this->_tpl_vars['RenderText']): ?>
    <?php if ($this->_tpl_vars['Editor']->GetLink()): ?>
        <?php if ($this->_tpl_vars['Editor']->GetShowImage() && ! $this->_tpl_vars['HideImage']): ?>
            <img src="<?php echo $this->_tpl_vars['Editor']->GetLink(); ?>
"><br/>
        <?php else: ?>
            <a class="image" target="_blank" title="download" href="<?php echo ((is_array($_tmp=$this->_tpl_vars['Editor']->GetLink())) ? $this->_run_mod_handler('escapeurl', true, $_tmp) : smarty_modifier_escapeurl($_tmp)); ?>
">Download file</a>
        <?php endif; ?>
    <?php else: ?>
        <div class="form-control-static text-muted"><?php echo $this->_tpl_vars['Captions']->GetMessageString('NoFile'); ?>
</div>
    <?php endif; ?>
<?php endif; ?>