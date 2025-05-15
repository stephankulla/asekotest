[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Width="400" Height="300" WindowStyle="None"
        AllowsTransparency="True" Background="Transparent">
    <Border Background="White" CornerRadius="20" BorderBrush="Gray" BorderThickness="2">
        <Grid>
            <Button Content="Schließen" HorizontalAlignment="Center" VerticalAlignment="Bottom"
                    Margin="10" Name="CloseButton"/>
        </Grid>
    </Border>
</Window>
"@

Add-Type -AssemblyName PresentationFramework
$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [System.Windows.Markup.XamlReader]::Load($reader)

# Fenster bewegbar machen
$window.Add_MouseDown({
    if ($_.LeftButton -eq [System.Windows.Input.MouseButtonState]::Pressed) {
        $window.DragMove()
    }
})

# Schließen-Button-Funktionalität hinzufügen
$closeButton = $window.FindName("CloseButton")
if ($closeButton -ne $null) {
    $closeButton.Add_Click({ $window.Close() })
} else {
    Write-Host "CloseButton konnte nicht gefunden werden."
}

# Fenster anzeigen
$window.ShowDialog() | Out-Null
