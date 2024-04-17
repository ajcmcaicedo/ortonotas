*				SET TALK OFF
*				SET STATUS OFF
*				ON SHUTDOWN quit
*				**_screen.WindowState=0
*				_screen.Caption="AGROPECUARIOS - COLACTEOS"

Public xcon,ycon,conexion,xservidor,xdb,bandera
bandera=.t.
*SET CENTURY ON 
				&& Conecta a la base de datos
				&&xdb=ALLTRIM(thisform.frame.p1.txtdb.value)
				&&xdb="COLACTEOS"
xdb="AJCM"
				***xdb="COLACTEOS_copia"
				&&xservidor=ALLTRIM(thisform.frame.p1.txtservidor.value)
				&&xservidor="ofi-auxsis1"
				&&xservidor="COLPAZDB"
**xservidor="LOCALHOST"
				&&xpasswd=ALLTRIM(thisform.frame.p1.Txtpasswd.value)

				**base = "COLACTEOS"
				**cAppConnectString = "DRIVER={SQL server};UID=;PWD=;SERVER=AJCM\SQLEXPRESS;DATABASE="+cDns
				**cadenaconexion = "DRIVER={SQL server};"+"UID=;"+"PWD=;"+"SERVER="+xservidor+";"+"DATABASE="+xdb
				**conexion= Sqlstringconnect(cadenaconexion) 
				**MESSAGEBOX (xservidor)
cadenaconexion = "Driver={PostgreSQL UNICODE};Server=localhost;Port=5432;Database=ajcm;Uid=postgres;Pwd=a123456*;"
conexion= Sqlstringconnect(cadenaconexion) 


**Driver={PostgreSQL UNICODE};Server=localhost;Port=5432;Database=ajcm;Uid=Postgre;Pwd=a123456*;



				if conexion <=0
messagebox('ESTE USUARIO NO TIENE CONEXION A LA BASE DE DATOS',64,'AVISO')
return .f.
ELSE
	&&messagebox('SE HA CONECTADO A LA BASE DE DATOS',64,'AVISO')
	WAIT 'CONECTANDO CON LA BASE ...'WINDOW  TIMEOUT 1
 
ENDIF
SQLDISCONNECT(conexion)

	set sysmenu to default
	Local oldScreenLeft
	Local oldScreenTop
	Local oldScreenHeight
	Local oldScreenWidth
	Local oldScreenColor
	WITH _Screen
       oldScreenLeft=.Left                 && Guardar el tamaño y la posición actuales
	   oldScreenTop=.Top
	   oldScreenHeight=.Height
	   oldScreenWidth=.Width
	   oldScreenColor = .Backcolor
		*.LockScreen=.T.                     && Desactiva el redibujado de pantalla
		.BackColor=rgb(192,192,192)         && Cambiar el color de fondo a gris
		.BorderStyle=2                     && Cambiar el borde a doble
		.Closable=.T.                       && Quitar botones de control de ventana
		.ControlBox=.F.
		.MaxButton=.T.
		.MinButton=.T.
		.Movable=.T.
		.Height=600		
		.Width=1250
		.Caption="Ortomax - Guayaquil.                                                                                                                                                                        Alberto Caicedo"            && Establecer un título
		.LockScreen=.F.     
		**.Left = oldScreenLeft               && Restablecer el tamaño
        .AutoCenter=.T.
        **.Top = 200                 && y posición original
        **.SCREEN = OFF
ENDWITH
SET SYSMENU OFF

**=MESSAGEBOX("Return to normal  ",48,WTITLE())
DO menu1.mpr
READ events


