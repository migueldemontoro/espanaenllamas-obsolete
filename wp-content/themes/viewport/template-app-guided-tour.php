<?php
/*
Template Name: España en Llamas - Guided Tour
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
                  Los 214.012 incendios forestales ocurridos entre 2001 y 2013 quemaron 1.518.311 hectáreas (ha), una superficie mayor que la que tienen 9 de las 17 Comunidades Autónomas españolas, entre ellas: Murcia, Asturias, Navarra, Madrid o País Vasco. En el mapa mostramos los incendios que calcinaron 100 ha o más, equivalente a un 63,1% del total de la superficie quemada.
                </div>
                
                <div id="grandes-cifras">  
                  <div id="tit-cifras">Cifras de incendios de 100 hectáreas o más (mostrados en el mapa)</div>
                    <ul id="gcifras-int">
                      <li>1.974 <span>incendios</span></li>
                      <li>1.228 <span>intencionados</span></li>
                      <li class="ultimo">958.364 <span>ha quemadas</span></li>
                    </ul>
                    <div id="tit-cifras"></div>
                    <ul id="gcifras-int">
                      <li>41 <span>muertos</span></li>
                      <li>229 <span>heridos</span></li>
                      <li class="ultimo"><span>Costaron más de </span>749M €</li>
                    </ul>
                </div>
              </div>
             
              <div class="capitulo">                    
                <div id="botones-lat">  
                  <div id="1" class="titular-his">La mayoría son incendios Intencionados</div>
                  <div id="2" class="titular-his">Grandes Incendios Forestales</div>
                  <div id="8" class="titular-his">Espacios Naturales... ¿Protegidos?</div>
                  <div id="4" class="titular-his">2003: Rayos en Extremadura</div>
                  <div id="5" class="titular-his">2005: 17 muertes</div>
                  <div id="6" class="titular-his">2006: Año negro en Galicia</div>
                  <div id="7" class="titular-his">2007: El fuego arrasa Canarias</div>
                  <div id="9" class="titular-his">2011: Octubre Rojo</div>
                  <div id="3" class="titular-his">2012: El peor año del siglo XXI</div>
                </div>
                <div id="textos-historias">
                  <div id="t1" class="txtf">
                    <p>El hombre es el principal causante de la mayoría de los 214.012 incendios ocurridos entre 2001 y 2013. Además, el 55% se inició de manera intencionada.</p>
                    <p>La comunidad autónoma más afectada fue Galicia, donde se quemaron un 24% del total de las hectáreas arrasadas por el fuego en España. El 80% de esos incendios fueron intencionados. En segundo lugar se sitúa Castilla y León, que suma un 19% de la superficie total calcinada durante esos 13 años.</p>
                    <p>Los datos facilitados por el Gobierno en relación a las pérdidas económicas y los gastos en extinción de incendios forestales son muy incompletos. De acuerdo a esas informaciones oficiales, los siniestros costaron al erario público más de 1.100 millones de euros.</p>
                  </div>
                  <div id="t2" class="txtf">
                    <p>Los incendios de 500 hectáreas o más ─denominados oficialmente "grandes incendios forestales" (GIF) ─ son pocos en número, pero sus consecuencias son devastadoras. En términos cuantitativos, representan tan sólo el 0,17 por ciento del total de los incendios ocurridos entre 2001 y 2013. Sin embargo, causaron el 41,64% del total de la superficie quemada.</p>
                    <p>WWF España destaca en su informe <a href="http://awsassets.wwf.es/downloads/bosques_listos_para_arder_wwf.pdf" target="_blank">Bosques listos para arder</a> de 2015 que “en regiones como la Comunidad Valenciana, Cataluña o Canarias, al menos el 85% de la superficie quemada al año (2005-2014) se debe a GIF”. WWF expone que los GIF se originan en masas forestales donde se han plantado especies monoespecíficas muy inflamables que facilitan la propagación del fuego como Eucaliptus, Pinus halepensis o Pinus pinaster. Propone la regeneración de bosques mixtos e irregulares con especies autóctonas más resistentes a los incendios. </p>
                  </div>      
                  <div id="t3" class="txtf">
                    <p>El verano de 2012 fue extremadamente <a href="http://www.aemet.es/documentos/es/serviciosclimaticos/vigilancia_clima/resumenes_climat/anuales/res_anual_clim_2012.pdf" target="_blank">cálido y seco</a> en España, condiciones que favorecieron que ese año haya sido el peor en términos de superficie forestal calcinada desde 1994, cuando se quemaron casi medio millón de hectáreas.</p>
                    <p>En 2012 ardieron 216.893 ha, una extensión equivalente a la provincia de Vizcaya. De los 15.978 incendios ocurridos, más de nueve mil fueron intencionados. Entre éstos, al menos 2.888 fueron provocados por pastores y ganaderos para regenerar el pasto; 211 para facilitar la caza; o 143 por venganzas.</p>
                    <p>La Comunidad Valenciana sufrió especialmente el rigor de los incendios veraniegos y encabezó el ranking por CCAA: 56.931 ha calcinadas. Sólo el iniciado en Cortes de Pallás (Valencia), debido a una negligencia de dos operarios que estaban soldando unas placas solares en plena ola de calor, quemó 28.879 ha. Se convirtió así en el segundo más grave del siglo XXI después del siniestro de Río Tinto (Huelva), que en 2004 hizo arder 29.867 ha.</p>
                  </div>
                  <div id="t4" class="txtf">
                    <p>Las tormentas secas del verano de 2003 hicieron arder Extremadura. Los rayos iniciaron los incendios más devastadores. Sólo en los dos primeros días de agosto hubo hasta 15 fuegos que carbonizaron más de 16.500 hectáreas.</p>
                    <p>Sólo en ese año ardió un 31,75% de todas las hectáreas forestales quemadas en Extremadura entre 2001 y 2013.</p>
                    <p>De acuerdo con las estadísticas oficiales y el análisis de las mismas realizado por <a href="http://www.civio.es" target="_blank">Civio</a>, en ese mismo intervalo de años los rayos provocaron 9.333 incendios forestales en España, un 4,36% del total, que quemaron 88.067 ha, una cifra equivalente al 5,8% de la superficie calcinada.</p>
                  </div>
                  <div id="t5" class="txtf">
                    <p>Las cifras de 2005 superan al resto de años del periodo 2001-2013 en casi todos los indicadores: Número de incendios, heridos y muertos. Ardieron 188.697 hectáreas, un 12,43% del total. Además, hubo 17 fallecidos y 102 heridos.</p>
                    <p>El peor incendio empezó el 16 de julio en Riba de Saelices (Guadalajara). Fue provocado por unos excursionistas que manipulaban una barbacoa. Acabó con la vida de 11 miembros de una brigada antiincendios. Hicieron falta 17 días para extinguirlo y devastó más de 12.700 hectáreas.</p>
                    <div class="butFire" id="2005190182">Ver incendio</div>
                    <p>Sin embargo, el año más aciago del siglo XXI para los bosques en cuanto a hectáreas quemadas fue 2012. El fuego quemó 216.894 hectáreas de superficie forestal</b>, o 2.168 km². Para poner en valor esa cifra, apuntamos que la provincia de Guipúzcoa tiene 1.980 km².</p>
                  </div>
                  <div id="t6" class="txtf">
                    <p>Galicia es la comunidad autónoma donde se produjeron más incendios entre 2001 y 2013: Un 40,25% del total de España. La mayoría fueron intencionados, hasta un 80%. Pontevedra y Orense fueron las provincias más afectadas.</p>
                    <p>2006 fue fatídico para Galicia y sus bosques. Sólo en julio y agosto se iniciaron más de 4.000 fuegos. Para finales de diciembre, las llamas habían arrasado 95.947 hectáreas de superficie forestal, más de un cuarto del total de las quemadas en Galicia entre 2001 y 2013. Exactamente un 26,18%.</p>
                    <p>No obstante, las cifras oficiales facilitadas en el <i>Cuarto Inventario Forestal Nacional</i> relativo a Galicia (2011) indican que desde 1974 la superficie arbolada en esa región “se ha incrementado en un 27%”. Asimismo, señala ese informe que “la cantidad de árboles y el volumen de madera de las especies arbóreas presentes en los montes gallegos crecieron entre el 30% y el 45%” respecto al Tercer Inventario, publicado en 2001.</p>
                  </div>
                  <div id="t7" class="txtf">
                    <p>El 62% de las hectáreas quemadas en Canarias durante el periodo 2001-2013 se perdieron en un solo año: 2007. Dos incendios intencionados, uno en Las Palmas y otro en Tenerife, fueron los más devastadores.</p>
                    <p>El primero de ellos comenzó el 27 de julio en Tejeda. Duró 29 días y quemó 18.673 hectáreas. Las llamas alcanzaron la Reserva Natural de Inagua, un pinar de unas 3.500 ha que quedó abrasado casi por completo, según los datos del Ministerio de Agricultura, Alimentación y Medio Ambiente (MAGRAMA). Tres días después, el 30 de julio, otro fuego iniciado en Los Realejos (Tenerife) afectó al Parque Nacional de Las Cañadas del Teide.</p>
                    <p>2012 fue también un año siniestro para Canarias. Se produjeron hasta cuatro grandes incendios forestales –500 ha o más-, <a href="http://www.magrama.gob.es/es/desarrollo-rural/estadisticas/Los_incendios_forestales_en_Espa%C3%B1a_2012_tcm7-349124.pdf" target="_blank">según informó en abril pasado el MAGRAMA</a>. El fuego que afectó al Parque Nacional de Garajonay, declarado Patrimonio de la Humanidad en 1986, arrasó el 8% de la superficie total de la isla de La Gomera.</p>
                  </div>
                  <div id="t8" class="txtf">
                    <p>El 15,83% del suelo calcinado entre 2005 (primer dato disponible) y 2013 estaba en un espacio natural protegido. El hecho de estar "protegido" no los pone a salvo de las llamas.</p>
                    <p>Un caso llamativo es el Parque Natural del Lago de Sanabria (Zamora), el mayor lago de origen glaciar de la Península. En tan sólo ocho años sufrió 186 incendios que abrasaron 15.745 hectáreas, según los datos facilitados por el Ministerio de Agricultura, Alimentación y Medio Ambiente. Casi todos esos fuegos figuran en los partes oficiales de incendios como intencionados.</p>
                    <p>Entre las principales motivaciones registradas se encuentran: la regeneración de pastos y la eliminación de matorrales por parte de pastores y ganaderos o la reproducción de fuegos mal extinguidos.</p>
                  </div>
                  <div id="t9" class="txtf">
                    <p>En octubre de 2011 se registraron 15 Grandes Incendios Forestales (GIF) que quemaron cerca de 19.000 ha. <b>Este hecho tan inhabitual motivó la puesta en marcha del proyecto</b> <a href="http://www.espanaenllamas.es" target="_blank">España en llamas</a>.</p>
                    <p>En ese caluroso octubre se registró un incremento de más de 2 grados respecto a la temperatura media de referencia del periodo 1971-2000, según el <a href="http://www.aemet.es/es/noticias/2011/11/climatologicooctubre2011" target="_blank">AEMET</a>. Hubo 3.454 incendios, lo que supuso un 472% más respecto al promedio de ese mismo mes en el periodo 2001-2010. Las cifras del área quemada son aún más alarmantes: 44.187 ha quemadas, un 1512% más que el promedio de la superficie que ardió en los meses de octubre del decenio inmediatamente anterior.</p>
                    <p>La provincia peor parada fue Orense. En ese mes de octubre se produjo una oleada de 11 GIF, incluido el incendio más devastador del 2011 que afectó a una extensión de 3.276 ha de Manzaneda. Precisamente en ese municipio se iniciaron 3 GIF en el intervalo de sólo seis días, del 13 al 18, que dejaron el saldo catastrófico de 5.351 ha quemadas.</p>
                    <div class="butFire" id="2011322255">Ver incendio</div>
                  </div>
                  <div id="explicacion" class="txtf">
                    <p>La <a href="http://civio.es" target="_blank">Fundación Ciudadana Civio</a> ha tenido acceso a la base de datos nacional de incendios forestales del Ministerio de Agricultura, Alimentación y Medio Ambiente. Hasta ahora, solo había <a href="http://www.magrama.gob.es/es/biodiversidad/estadisticas/Incendios_default.aspx" target="_blank">estadísticas</a>. Por primera vez, información tan detallada sobre incendios ve la luz pública.</p>
                    <p>"Visita guiada" es una selección de nueve historias destacadas entre 2001 y 2013 (últimos datos disponibles).</p>
                    <p>En "Explora los incendios" puedes interactuar con los fuegos de 100 hectáreas o más, seleccionar aquellos que más te interesen o localizar los cercanos a un municipio. Esta es una buena herramienta para poner en contexto los incendios que están ocurriendo.</p>
                    <p>Abajo, podrás ver qué pasó año a año o incluso descargar los datos para comprobarlos.</p>
                    <p>Y si quieres que sigamos investigando, puedes  <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=9QCM4WNJKQ9US" target="_blank">hacer una donación</a>.</p>
                  </div>
                </div>
              </div>

              <div id="main">
                <div id="map-wrapper">
                  <div id="mapa"></div>
                  <div class="cuadro">  
                    <div class="cuadro-historia" id="primera-historia">
                      <div class="titf"></div>
                      <div class="txtf"></div>  
                    </div>
                  </div> 
                </div>
                <div class="claves-fuegos">
                  <p>El tamaño de las burbujas es el tamaño real de la superficie quemada:</p>
                  <ul>
                    <li><span class="fuego-int"></span> Fuego intencionado</li>
                    <li><span class="fuego-noint"></span> Fuego no intencionado</li>
                  </ul>
                </div>
              </div>

              <div id="timSlider">
                <div id="playBtn" class="play" style="float: left;"></div>
                <div id="yearnavbar" style="float: left;"></div>
              </div>
                 
              <div class="firmafuente">
                <a href="/index.php/metodologia-del-mapa-de-incendios">Metodología: Cómo se hizo el mapa de España en Llamas</a>.</br>
                <a href="<?php echo get_template_directory_uri(); ?>/app/data/data.zip">Descargar datos</a> de todos los incendios de 100 hectáreas o más reflejados en el mapa.
              </div>
              <div class="firmafuente">
                Realizado por la <a href="http://civio.es" target="_blank">Fundación Ciudadana Civio</a>, en colaboración con <a href="http://es.linkedin.com/pub/juan-elosua/b/274/689" target="_blank">Juan Elosua</a> y <a href="http://thisisvisual.info" target="_blank">This is Visual</a>.<br />
                <strong>Fuente:</strong> Base de Datos Nacional de Incendios Forestales (EGIF) 2001-2012. Si la geolocalización exacta del incendio no estaba disponible se aproximó al municipio.
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
