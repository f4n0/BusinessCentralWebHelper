$(document).ready(function () {

    $('#controlAddIn').append('<div id="example-table"></div>');

    var table = new Tabulator("#example-table", {
        autoColumns: true,
        maxHeight: "100%"
    });;


    window.ClearTable = function () {
        table.clearData()
    }

    window.SetData = function (data) {


        if (table.getDataCount() > 1) {

            table.addData(jdata);
        }
        else
            table.setData(jdata);
    }
});