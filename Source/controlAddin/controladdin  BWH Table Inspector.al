controladdin "BWH Table Inspector"
{
    MaximumHeight = 500;
    MinimumWidth = 700;
    MinimumHeight = 500;
    RequestedHeight = 500;
    RequestedWidth = 700;

    Scripts = 'https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js',
    'https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js',
    'https://unpkg.com/tabulator-tables@4.7.1/dist/js/tabulator.min.js',
    'Source\Scripts\main.js';
    StyleSheets =
    'https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css',
    'https://unpkg.com/tabulator-tables@4.7.1/dist/css/tabulator.min.css';

    procedure ClearTable()
    procedure SetData(Record1: Text)
}