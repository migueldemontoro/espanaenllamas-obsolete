        
        <?php zilla_content_end(); ?>
		<!-- END #content -->
		</div>
		
		<?php zilla_footer_before(); ?>
		<!-- BEGIN #footer -->
		<div id="footer">
	    <?php zilla_footer_start(); ?>
		    
		    <?php 
    		    $footer_feature_posts = zilla_get_option('footer_feature_posts');
                get_template_part('content', 'footer-feature');
			?>
			
		    <div class="footer-widgets">
		    	<div class="inner clearfix">
					<div class="col"><?php dynamic_sidebar( 'footer1' ); ?></div>
					<div class="col middle"><?php dynamic_sidebar( 'footer2' ); ?></div>
					<div class="col last"><?php dynamic_sidebar( 'footer3' ); ?></div>
				</div>
		    </div>
		    
		    <div class="footer-bottom inner">
				<p class="copyright">&copy; <?php _e('Copyright', 'zilla') ?> <?php echo date( 'Y' ); ?>. <?php _e('Powered by', 'zilla') ?> <a href="http://wordpress.org/">WordPress</a></p>
			
				<p class="credit"><a href="http://www.themezilla.com/themes/viewport/">Viewport Theme</a> by <a href="http://www.themezilla.com/">ThemeZilla</a></p>
			</div>
		
		<?php zilla_footer_end(); ?>
		<!-- END #footer -->
		</div>
		<?php zilla_footer_after(); ?>
		
	<!-- END #container -->
	</div> 
		
	<!-- Theme Hook -->
	<?php wp_footer(); ?>
	<?php zilla_body_end(); ?>
	
<!--END body-->
</body>
<!--END html-->
</html>