Add-Type -AssemblyName PresentationFramework

[xml]$xaml = @"
<Window 
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="ComboBox mit Tabelle" Height="300" Width="400">
    <Grid>
        <ComboBox x:Name="cmbTabelle" HorizontalAlignment="Left" VerticalAlignment="Top" Width="300" Height="30" Margin="10">
            <ComboBox.ItemTemplate>
                <DataTemplate>
                    <StackPanel Orientation="Horizontal">
                        <TextBlock Text="{Binding Spalte1}" Width="100" />
                        <TextBlock Text="{Binding Spalte2}" Width="100" />                        
                    </StackPanel>
                </DataTemplate>
            </ComboBox.ItemTemplate>
        </ComboBox>
    </Grid>
</Window>
"@

$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [System.Windows.Markup.XamlReader]::Load($reader)

# Daten für die Tabelle
$data = @(
    [PSCustomObject]@{ Spalte1 = "Monie-Service"; Spalte2 = "Telefon(Hardware)"},
    [PSCustomObject]@{ Spalte1 = "Wert A"; Spalte2 = "Wert B"},
    [PSCustomObject]@{ Spalte1 = "Wert X"; Spalte2 = "Wert Y"}
)

# ComboBox mit Daten füllen
$cmbTabelle = $window.FindName("cmbTabelle")
$cmbTabelle.ItemsSource = $data
$cmbTabelle.SelectedIndex = 0
$cmbTabelle.SelectedValue.Spalte1

# Fenster anzeigen
$window.ShowDialog() | Out-Null