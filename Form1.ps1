Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName WindowsBase
Add-Type -AssemblyName PresentationCore

Add-Type -TypeDefinition @"
using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Input;

public class MyWindow : System.Windows.Window
{
    public MyWindow()
    {
        // Fenster-Eigenschaften
        this.Width = 400;
        this.Height = 300;
        this.WindowStyle = System.Windows.WindowStyle.None;
        this.AllowsTransparency = true;
        this.Background = System.Windows.Media.Brushes.Transparent;

        // Border erstellen
        System.Windows.Controls.Border border = new System.Windows.Controls.Border();
        border.Background = System.Windows.Media.Brushes.White;
        border.CornerRadius = new System.Windows.CornerRadius(20);
        border.BorderBrush = System.Windows.Media.Brushes.Gray;
        border.BorderThickness = new System.Windows.Thickness(2);

        // Grid erstellen
        System.Windows.Controls.Grid grid = new System.Windows.Controls.Grid();

        // Schließen-Button erstellen
        System.Windows.Controls.Button closeButton = new System.Windows.Controls.Button();
        closeButton.Content = "Schließen";
        closeButton.HorizontalAlignment = System.Windows.HorizontalAlignment.Center;
        closeButton.VerticalAlignment = System.Windows.VerticalAlignment.Bottom;
        closeButton.Margin = new System.Windows.Thickness(10);
        closeButton.Click += (s, e) => this.Close();

        // Button zum Grid hinzufügen
        grid.Children.Add(closeButton);

        // Grid in Border einfügen
        border.Child = grid;

        // Border als Fensterinhalt setzen
        this.Content = border;

        // Fenster bewegbar machen
        this.MouseDown += (s, e) => 
        { 
            if (e.LeftButton == System.Windows.Input.MouseButtonState.Pressed) 
                this.DragMove(); 
        };
    }
}
"@ -Language CSharp

# Erstelle ein neues Fenster und zeige es an
$window = New-Object MyWindow
$window.ShowDialog()
