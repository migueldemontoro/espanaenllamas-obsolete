<?php
/*
Template Name: España en Llamas - Vis3
*/
?>

<?php get_header(); ?>

      <div class="clearfix">
        <!--BEGIN #primary .hfeed-->
        <div id="primary" class="hfeed full-width">
        <?php if (have_posts()) : while (have_posts()) : the_post(); ?>
  
                  <?php zilla_page_before(); ?>
          <!--BEGIN .hentry-->
          <div <?php post_class() ?> id="post-<?php the_ID(); ?>">
          <?php zilla_page_start(); ?>
          
            <h1 class="entry-title"><?php the_title(); ?></h1>
                      <?php if ( current_user_can( 'edit_post', $post->ID ) ): ?>
                        
            <!--BEGIN .entry-meta .entry-header-->
            <div class="entry-meta entry-header">
              <?php edit_post_link( __('edit', 'zilla'), '<span class="edit-post">[', ']</span>' ); ?>
            <!--END .entry-meta .entry-header-->
                      </div>
                      <?php endif; ?>
  
            <!--BEGIN .entry-content -->
            <div class="entry-content">
              <?php the_content(); ?>
            <!--END .entry-content -->
            </div>
                  
                  <?php zilla_page_end(); ?>
          <!--END .hentry-->
          </div>
          <?php zilla_page_after(); ?>
          
          <?php 
              zilla_comments_before();
              comments_template('', true); 
              zilla_comments_after();
          ?>
  
          <?php endwhile; endif; ?>
        
        <!--END #primary .hfeed-->
        </div>
      </div>

<?php get_footer(); ?>
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/vis/libs/d3/d3.v2.min.js"></script>
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/vis/libs/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/vis/libs/jquery/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/vis/libs/footable/footable-0.1.js"></script>
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/vis/libs/footable/footable.sortable.js"></script>
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/vis/vis3/js/app.js"></script>
<link rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/vis/styles/footable/footable-0.1.css"/>
<link rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/vis/styles/footable/footable.sortable.css"/>
<link rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/vis/vis3/styles/app.css"/>