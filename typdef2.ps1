# Lade die Assembly für Windows Forms
Add-Type -AssemblyName System.Windows.Forms

# Erstelle ein Formular
$form = New-Object System.Windows.Forms.Form
$form.Text = "Testformular"
$form.Width = 300
$form.Height = 200

# Button erstellen
$button = New-Object System.Windows.Forms.Button
$button.Text = "Klicken"
$button.Width = 100
$button.Height = 30
$button.Top = 70
$button.Left = 100

# Button-Klick-Ereignis
$button.Add_Click({ [System.Windows.Forms.MessageBox]::Show("Button wurde geklickt!") })

# Button zum Formular hinzufügen
$form.Controls.Add($button)

# Zeige das Formular an
[System.Windows.Forms.Application]::Run($form)