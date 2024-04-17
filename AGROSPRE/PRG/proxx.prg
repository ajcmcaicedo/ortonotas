CLOSE ALL  && Close tables and databases
OPEN DATABASE (HOME(2) + 'Data\testdata')

USE customer  IN 0  && Opens Customer table

frmMyForm = CREATEOBJECT('Form')  && Create a Form
frmMyForm.Closable = .f.  && Disable the Control menu box 

frmMyForm.AddObject('cmdCommand1','cmdMyCmdBtn')  && Add Command button
frmMyForm.AddObject('grdGrid1','Grid')  && Add Grid control

frmMyForm.grdGrid1.Left = 25  && Adjust Grid position

frmMyForm.grdGrid1.SetAll("DynamicBackColor", ;
   "IIF(MOD(RECNO( ), 2)=0, RGB(255,255,255) ;
   , RGB(0,255,0))", "Column")  && Alternate white and green records

frmMyForm.grdGrid1.Visible = .T.  && Grid control visible
frmMyForm.cmdCommand1.Visible =.T.  && "Quit" Command button visible
frmMyForm.grdGrid1.Column1.Header1.Caption = 'Customer ID'

frmMyForm.SHOW  && Display the form
READ EVENTS  && Start event processing

DEFINE CLASS cmdMyCmdBtn AS CommandButton  && Create Command button
   Caption = '\<Quit'  && Caption on the Command button
   Cancel = .T.  && Default Cancel Command button (Esc)
   Left = 125  && Command button column
   Top = 210  && Command button row
   Height = 25  && Command button height

   PROCEDURE Click
      CLEAR EVENTS  && Stop event processing, close Form
      CLOSE ALL  && Close table and database
ENDDEFINE
