<?php
/*
Template Name: España en Llamas - Explore
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
            <div class="entry-content" id="super-contenedor">
              <div id="segunda-parte">
                <div id="entradilla">
                  Los 187.239 incendios forestales ocurridos entre 2001 y 2011 quemaron 1.239.524 hectáreas (ha), una superficie mayor que la que tienen 9 de las 17 Comunidades Autónomas españolas, entre ellas: Murcia, Asturias, Navarra, Madrid o País Vasco. En el mapa mostramos los incendios que calcinaron 100 ha o más, equivalente a un 60,8% del total de la superficie quemada.
                </div>
                
                <div id="grandes-cifras">  
                  <div id="tit-cifras">Cifras de incendios de 100 hectáreas o más (mostrados en el mapa)</div>
                  <ul id="gcifras-int">
                    <li>1.679 <span>incendios</span></li>
                    <li>1.044 <span>intencionados</span></li>
                    <li class="ultimo">753.757 <span>ha quemadas</span></li>
                  </ul>
                  <div id="tit-cifras"></div>
                  <ul id="gcifras-int">
                    <li>32 <span>muertos</span></li>
                    <li>195 <span>heridos</span></li>
                    <li class="ultimo"><span>Costaron más de </span>1.000M €</li>
                  </ul>
                </div>
              </div>
             
              <div id="explora" class="capitulo">                    
                <div id="selectores"> 
                  <div id="causas" class="selector"><span>Causa del incendio</span>
                    <ul>
                      <li>
                        <select id="cau" name="menu">
                          <option class="optionGroup" value="0" selected>Todas</option>
                          <option class="optionChild" value="1">Intencionado</option>
                          <option class="optionChild" value="2">No Intencionado</option>
                        </select>
                      </li>
                    </ul>
                  </div>
                  <div id="sinies" class="selector"><span>Siniestralidad</span>
                    <ul>
                      <li>
                        <select id="sin" name="menu">
                          <option class="optionGroup" value="0" selected>Todos</option>
                          <option class="optionChild" value="1">Con Muertos</option>
                          <option class="optionChild" value="2">Con Heridos</option>
                        </select>
                      </li>
                    </ul>
                  </div>
                  <div id="localiz" class="selector"><span>Por localización</span>
                    <ul>
                      <li>
                        <select id="loc" name="menu">
                          <option class="optionGroup" value="0;0" selected>Todas</option>
                          <option disabled>----------</option>
                          <option class="optionGroup" value="4;0"><strong>Andalucía</strong></option>
                          <option class="optionChild" value="4;4">&nbsp;&nbsp;&nbsp;&nbsp;Almería</option>
                          <option class="optionChild" value="4;11">&nbsp;&nbsp;&nbsp;&nbsp;Cádiz</option>
                          <option class="optionChild" value="4;14">&nbsp;&nbsp;&nbsp;&nbsp;Córdoba</option>
                          <option class="optionChild" value="4;18">&nbsp;&nbsp;&nbsp;&nbsp;Granada</option>
                          <option class="optionChild" value="4;21">&nbsp;&nbsp;&nbsp;&nbsp;Huelva</option>
                          <option class="optionChild" value="4;23">&nbsp;&nbsp;&nbsp;&nbsp;Jaén</option>
                          <option class="optionChild" value="4;29">&nbsp;&nbsp;&nbsp;&nbsp;Málaga</option>
                          <option class="optionChild" value="4;41">&nbsp;&nbsp;&nbsp;&nbsp;Sevilla</option>
                          <option disabled>----------</option>
                          <option class="optionGroup" value="10;0"><strong>Aragón</strong></option> 
                          <option class="optionChild" value="10;22">&nbsp;&nbsp;&nbsp;&nbsp;Huesca</option>
                          <option class="optionChild" value="10;44">&nbsp;&nbsp;&nbsp;&nbsp;Teruel</option>
                          <option class="optionChild" value="10;50">&nbsp;&nbsp;&nbsp;&nbsp;Zaragoza</option>
                          <option disabled>----------</option>
                          <option class="optionGroup" value="5;33"><strong>Asturias</strong></option>
                          <option disabled>----------</option>
                          <option class="optionGroup" value="15;7"><strong>Islas Baleares</strong></option>
                          <option disabled>----------</option>
                          <option class="optionGroup" value="12;0"><strong>Islas Canarias</strong></option>
                          <option class="optionChild" value="12;35">&nbsp;&nbsp;&nbsp;&nbsp;Las Palmas</option>
                          <option class="optionChild" value="12;38">&nbsp;&nbsp;&nbsp;&nbsp;S.C. de Tenerife</option>
                          <option disabled>----------</option>
                          <option class="optionGroup" value="6;39"><strong>Cantabria</strong></option>
                          <option disabled>----------</option>
                          <option class="optionGroup" value="11;0"><strong>Castilla-La Mancha</strong></option>
                          <option class="optionChild" value="11;2">&nbsp;&nbsp;&nbsp;&nbsp;Albacete</option>
                          <option class="optionChild" value="11;13">&nbsp;&nbsp;&nbsp;&nbsp;Ciudad Real</option>
                          <option class="optionChild" value="11;16">&nbsp;&nbsp;&nbsp;&nbsp;Cuenca</option>
                          <option class="optionChild" value="11;19">&nbsp;&nbsp;&nbsp;&nbsp;Guadalajara</option>
                          <option class="optionChild" value="11;45">&nbsp;&nbsp;&nbsp;&nbsp;Toledo</option>
                          <option disabled>----------</option>
                          <option class="optionGroup" value="17;0"><strong>Castilla y León</strong></option>
                          <option class="optionChild" value="17;5">&nbsp;&nbsp;&nbsp;&nbsp;Ávila</option>
                          <option class="optionChild" value="17;9">&nbsp;&nbsp;&nbsp;&nbsp;Burgos</option>
                          <option class="optionChild" value="17;24">&nbsp;&nbsp;&nbsp;&nbsp;León</option>
                          <option class="optionChild" value="17;34">&nbsp;&nbsp;&nbsp;&nbsp;Palencia</option>
                          <option class="optionChild" value="17;37">&nbsp;&nbsp;&nbsp;&nbsp;Salamanca</option>
                          <option class="optionChild" value="17;40">&nbsp;&nbsp;&nbsp;&nbsp;Segovia</option>
                          <option class="optionChild" value="17;42">&nbsp;&nbsp;&nbsp;&nbsp;Soria</option>
                          <option class="optionChild" value="17;47">&nbsp;&nbsp;&nbsp;&nbsp;Valladolid</option>
                          <option class="optionChild" value="17;49">&nbsp;&nbsp;&nbsp;&nbsp;Zamora</option>
                          <option disabled>----------</option>
                          <option class="optionGroup" value="2;0"><strong>Cataluña</strong></option>
                          <option class="optionChild" value="2;8">&nbsp;&nbsp;&nbsp;&nbsp;Barcelona</option>
                          <option class="optionChild" value="2;17">&nbsp;&nbsp;&nbsp;&nbsp;Girona</option>
                          <option class="optionChild" value="2;25">&nbsp;&nbsp;&nbsp;&nbsp;Lleida</option>
                          <option class="optionChild" value="2;43">&nbsp;&nbsp;&nbsp;&nbsp;Tarragona</option>
                          <option disabled>----------</option>
                          <option class="optionGroup" value="9;0"><strong>Comunidad Valenciana</strong></option>
                          <option class="optionChild" value="9;3">&nbsp;&nbsp;&nbsp;&nbsp;Alicante</option>
                          <option class="optionChild" value="9;12">&nbsp;&nbsp;&nbsp;&nbsp;Castellón</option>
                          <option class="optionChild" value="9;46">&nbsp;&nbsp;&nbsp;&nbsp;Valencia</option>
                          <option disabled>----------</option>
                          <option class="optionGroup" value="14;0"><strong>Extremadura</strong></option>
                          <option class="optionChild" value="14;6">&nbsp;&nbsp;&nbsp;&nbsp;Badajoz</option>
                          <option class="optionChild" value="14;10">&nbsp;&nbsp;&nbsp;&nbsp;Cáceres</option>
                          <option disabled>----------</option>
                          <option class="optionGroup" value="3;0"><strong>Galicia</strong></option>
                          <option class="optionChild" value="3;15">&nbsp;&nbsp;&nbsp;&nbsp;A Coruña</option>
                          <option class="optionChild" value="3;27">&nbsp;&nbsp;&nbsp;&nbsp;Lugo</option>
                          <option class="optionChild" value="3;32">&nbsp;&nbsp;&nbsp;&nbsp;Ourense</option>
                          <option class="optionChild" value="3;36">&nbsp;&nbsp;&nbsp;&nbsp;Pontevedra</option>
                          <option disabled>----------</option>
                          <option class="optionGroup" value="16;28"><strong>Madrid</strong></option>
                          <option disabled>----------</option>
                          <option class="optionGroup" value="8;30"><strong>Murcia</strong></option>
                          <option disabled>----------</option>
                          <option class="optionGroup" value="13;31"><strong>Navarra</strong></option>
                          <option disabled>----------</option>
                          <option class="optionGroup" value="7;26"><strong>La Rioja</option>
                          <option disabled>----------</option>
                          <option class="optionGroup" value="1;0"><strong>País Vasco</strong></option>
                          <option class="optionChild" value="1;1">&nbsp;&nbsp;&nbsp;&nbsp;Álava</option>
                          <option class="optionChild" value="1;20">&nbsp;&nbsp;&nbsp;&nbsp;Guipúzcoa</option>
                          <option class="optionChild" value="1;48">&nbsp;&nbsp;&nbsp;&nbsp;Vizcaya</option>
                          <option disabled>----------</option>
                          <option class="optionGroup" value="18;51"><strong>Ceuta</strong></option>
                          <option disabled>----------</option>
                          <option class="optionGroup" value="19;52"><strong>Melilla</strong></option>
                        </select>
                      </li>
                    </ul>
                  </div>           
                  <div id="supSlider" class="selector">
                    <span>Superficie quemada (Ha)</span>
                    <div class="layout-slider">
                      <div id="slider"></div>
                      <input type="text" id="range"/>
                    </div>
                  </div>
                  <div class="cuadro-busq">
                    <span class="buscadores">Busca tu municipio</span>
                    <div class="busq-wrapper">
                      <input id="busqueda" type="text">
                    </div>
                    <div class="butira">
                      <div id="ir" class="search-form-button">Ir »</div>
                    </div>
                  </div>
                  <div class="reestab">Resetear</div>
                </div>                    
              </div>

              <div id="main">
                <div id="map-wrapper">
                  <div id="mapa"></div>
                  <div id="datos-flotantes">
                    <div class="extra-datos">Estos son los incendios según la selección realizada arriba. Por defecto salen los de 100 Ha o más.</div>
                    <ul>
                      <li>
                        <div class="titulo-datos">Incendios</div>
                        <div id="count" class="resultado-datos">-</div>
                      </li>
                      <li>
                        <div class="titulo-datos">Ha quemadas</div>
                        <div id="supQ" class="resultado-datos">-</div>
                      </li>
                      <li>
                        <div class="titulo-datos">Muertos</div>
                        <div id="muer" class="resultado-datos">-</div>
                      </li>
                      <li>
                        <div class="titulo-datos">Heridos</div>
                        <div id="heri" class="resultado-datos">-</div>
                      </li>
                      <li>
                        <div class="titulo-datos">Pérdidas generadas</div>
                        <div id="perd" class="resultado-datos">-</div>
                      </li>
                    </ul>
                  </div>
                </div>
                <div class="claves-fuegos">
                  <p>El tamaño de las burbujas es el tamaño real de la superficie quemada:</p>
                  <ul>
                    <li><span class="fuego-int"></span> Fuego intencionado</li>
                    <li><span class="fuego-noint"></span> Fuego no intencionado</li>
                  </ul>
                </div>
                <div class="mapa-canarias">
                  <img src="<?php echo get_template_directory_uri(); ?>/app/img/canarias.png" alt="Mapa de Canarias" title="Pulsa para localizar el mapa en Canarias"/>
                </div>
              </div>

              <div id="timSlider">
                <div id="playBtn" class="play" style="float: left;"></div>
                <div id="yearnavbar" style="float: left;"></div>
              </div>
                 
              <div class="firmafuente">
                Realizado por la <a href="http://civio.es" target="_blank">Fundación Ciudadana Civio</a>, en colaboración con <a href="http://es.linkedin.com/pub/juan-elosua/b/274/689" target="_blank">Juan Elosua</a> y <a href="http://thisisvisual.info" target="_blank">This is Visual</a>.<br />
                <strong>Fuente:</strong> Base de Datos Nacional de Incendios Forestales (EGIF) 2001-2011. Si la geolocalización exacta del incendio no estaba disponible se aproximó al municipio.
              </div>
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
<script type="text/javascript" src="https://maps.google.com/maps/api/js?libraries=geometry,places&sensor=false"></script>
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/app/libs/infoBox/infobox_packed.js"></script>
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/app/libs/d3/d3.v2.min.js"></script>
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/app/libs/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/app/libs/jquery/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/app/js/app.js"></script>
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/app/js/overlay.js"></script>
