<?php get_header(); ?>

<body>
<div class="container">
    <div class="row">
	    <div class="col-12"> 
		<?php       
			$custom_logo_id = get_theme_mod('custom_logo');

			$aLogo = wp_get_attachment_image_src($custom_logo_id , 'medium');

			if (has_custom_logo()) 
			{ // Si un logo a été défini
				echo '<img src="'.esc_url($aLogo[0]).'" alt="'.get_bloginfo('name').'" class="class-fluid">';
			} 
			else 
			{   // Sinon on affiche le nom du site
				echo '<h1>'.get_bloginfo('name').'</h1>';
			}
		?>
		</div>
	</div>

    <div class="row">
	    <div class="col-8">    
        <?php
if ( have_posts() ) : // S'il y a des articles 
    while ( have_posts() ) : the_post() // Tant qu'il y a des articles, alors pour chaque article on affiche : 
       ?>
       <h2><a href="<?php the_permalink() ?>" title="<?php the_title(); ?>"><?php the_title(); ?></a></h2>  
       <?php                        
       echo"<div>".the_excerpt()."</div>";
       echo"<hr>";
   endwhile;
endif;
?>
<div></div><hr>	    
</div>
	    <!-- sidebar.php -->
<div class="col-4 border border-dark">
   [ SIDEBAR ]
</div>	 </div>
</div> <!-- .container -->  
<?php get_footer(); ?>