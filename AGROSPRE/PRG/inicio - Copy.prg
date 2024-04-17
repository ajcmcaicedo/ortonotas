SET TALK OFF
SET STATUS OFF
ON SHUTDOWN quit
_screen.WindowState= 0
_screen.Caption="AGROPECUARIOS - COLACTEOS"

Public xcon,ycon,conexion,xservidor,xdb,bandera
bandera=.t.
SET CENTURY ON 
&& Conecta a la base de datos
&&xdb=ALLTRIM(thisform.frame.p1.txtdb.value)
xdb="COLACTEOS_copia"
&&xservidor=ALLTRIM(thisform.frame.p1.txtservidor.value)
&&xservidor="ofi-auxsis1"
xservidor="COLPAZDB"
&&xpasswd=ALLTRIM(thisform.frame.p1.Txtpasswd.value)

**base = "COLACTEOS"
**cAppConnectString = "DRIVER={SQL server};UID=;PWD=;SERVER=AJCM\SQLEXPRESS;DATABASE="+cDns
cadenaconexion = "DRIVER={SQL server};"+"UID=;"+"PWD=;"+"SERVER="+xservidor+";"+"DATABASE="+xdb
conexion= Sqlstringconnect(cadenaconexion) 
**MESSAGEBOX (xservidor)
if conexion <=0
messagebox('ESTE USUARIO NO TIENE CONEXION A LA BASE DE DATOS',64,'AVISO')
return .f.
ELSE
	&&messagebox('SE HA CONECTADO A LA BASE DE DATOS',64,'AVISO')
	WAIT 'CONECTANDO CON LA BASE ...'WINDOW  TIMEOUT 1
 



ENDIF

SQLDISCONNECT(conexion)
**DO menu1.mpr
DO FORM agros





READ events


