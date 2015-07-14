UPDATE PIF2 SET COMB_DET = CONCAT(DATE(DETECCION)," ",IFNULL(TIME(HDETECCION),'00:00:00')), 
COMB_CTRL = CONCAT(DATE(INCENDIOC)," ",IFNULL(TIME(HINCENDIOC),'00:00:00')), 
COMB_EXT = CONCAT(DATE(INCENDIOE)," ",IFNULL(TIME(HINCENDIOE),'00:00:00')),
COMB_LLEGPMT = CONCAT(DATE(LLEGADAPMT)," ",IFNULL(TIME(HLLEGADAPMT),'00:00:00')),
COMB_LLEGPMAE = CONCAT(DATE(LLEGADAPMAE)," ",IFNULL(TIME(HLLEGADAPMAE),'00:00:00')),
COMB_LLEGPBH = CONCAT(DATE(LLEGADAPBH)," ",IFNULL(TIME(HLLEGADAPBH),'00:00:00'));