Add-Type -AssemblyName PresentationFramework

[xml]$xaml = @"
<Window 
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:WpfAppAsekoWebShop"
        Title="MainWindow" Height="450" Width="800">
    <Grid x:Name="grdShop">
        <TextBox x:Name="txtVorname" HorizontalAlignment="Left" Margin="218,39,0,0" Text="TextBox" TextWrapping="Wrap" VerticalAlignment="Top" Width="120"/>
        <TextBox x:Name="txtNachname" HorizontalAlignment="Left" Margin="218,89,0,0" Text="TextBox" TextWrapping="Wrap" VerticalAlignment="Top" Width="120"/>
        <TextBox x:Name="txtUCCClient" HorizontalAlignment="Left" Margin="218,137,0,0" Text="TextBox" TextWrapping="Wrap" VerticalAlignment="Top" Width="120"/>
        <TextBox x:Name="txtUsername" HorizontalAlignment="Left" Margin="218,185,0,0" Text="TextBox" TextWrapping="Wrap" VerticalAlignment="Top" Width="120"/>
        <Label x:Name="lblVorname" Content="Vorname" HorizontalAlignment="Left" Margin="69,39,0,0" VerticalAlignment="Top" Width="118"/>
        <Label x:Name="lblNachname" Content="Nachname" HorizontalAlignment="Left" Margin="69,80,0,0" VerticalAlignment="Top" Width="118"/>
        <Label x:Name="lblUCCClient" Content="UccClient" HorizontalAlignment="Left" Margin="69,129,0,0" VerticalAlignment="Top" Width="118"/>
        <Label x:Name="lblUsername" Content="Username" HorizontalAlignment="Left" Margin="69,181,0,0" VerticalAlignment="Top" Width="118"/>
        <RadioButton x:Name="rbNational" Content="AmtsberechtigungNational" HorizontalAlignment="Left" Margin="81,250,0,0" VerticalAlignment="Top"/>
        <RadioButton x:Name="rbInternational" Content="AmtsberechtigungInternational" HorizontalAlignment="Left" Margin="81,276,0,0" VerticalAlignment="Top"/>
        <Button x:Name="btnStart" Content="Start" HorizontalAlignment="Left" Margin="81,327,0,0" VerticalAlignment="Top" Height="25" Width="92" />
    </Grid>
</Window>
"@

$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

$btnStart = $window.FindName("btnStart")
$txtVorname = $window.FindName("txtVorname")
$txtNachname = $window.FindName("txtNachname")
$txtUCCClient = $window.FindName("txtUCCClient")
$txtUsername = $window.FindName("txtUsername")
$rbNational = $window.FindName("rbNational")
$rbInternational = $window.FindName("rbInternational")

$btnStart.Add_Click({
    $vorname = $txtVorname.Text
    $nachname = $txtNachname.Text
    $uccClient = $txtUCCClient.Text
    $username = $txtUsername.Text
    $selectedRadioButton = if ($rbNational.IsChecked -eq $true) { "National" } elseif ($rbInternational.IsChecked -eq $true) { "International" } else { "None" }

    $data = @{
        Vorname = $vorname
        Nachname = $nachname
        UCCClient = $uccClient
        Username = $username
        SelectedRadioButton = $selectedRadioButton
    }

    $json = $data | ConvertTo-Json
    [System.Windows.MessageBox]::Show($json)
})

$window.ShowDialog() | Out-Null