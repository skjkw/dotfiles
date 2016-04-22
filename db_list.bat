@if(0)==(0) echo off
rem -*- coding: sjis -*-

chcp 932

cscript.exe //nologo //E:JScript "%~f0" "%~dp0"

echo 終了しました
@pause

GOTO :EOF
@end

var fso =  new ActiveXObject("Scripting.FileSystemObject");
var batchPath = WScript.Arguments.Unnamed(0);
var path = "\\21_設計\\03_データベース設計";
var filePath = "";
var cyoPath = '';

var rowAry = [
"B"
,"C"
,"D"
,"E"
,"F"
,"G"
,"H"
,"I"
,"J"
,"K"
,"L"
];

var header = [
"テーブル名"
,"テーブルID"
,"フィールド"
,"フィールド名"
,"型"
,"サイズ"
,"主キー"
,"ユニークキー"
,"外部キー"
,""
,"必須項目"
,"既定値"
,"備考"
];

function createHtml(){
    if(fso.FileExists(filePath + "db_list.html")){
        fso.DeleteFile(filePath + "db_list.html", true);
    }

    var file = fso.OpenTextFile(filePath + "db_list.html", 8, true, 0);
    file.Write("<html>");
    file.Write("<head><meta charset=\"shift-jis\"><link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css\"></head>");
    file.Write("<body>");
    file.Write("<div class=\"container\">");

    var excel = new ActiveXObject("Excel.Application");

    for(; !enume.atEnd(); enume.moveNext()){
        var fileLists =  enume.item();
        var fileName = fileLists.Name;
        if(fileName.search(/\.xls$/) == -1 || fileName == "データベース仕様書-雛形.xls"){
            continue;
        }
        WScript.Echo(fileName + " 処理中...");
        var book = excel.Workbooks.Open(path + "\\" + fileName, true, true);

        file.Write("<div class=\"panel panel-primary\">");

        file.Write("<div class=\"panel-heading\">");
        file.Write(fileName);
        file.Write("</div>");

        file.Write("<div class=\"panel-body\">");

        for(var i = 0; i < book.Worksheets.Count; i++){
            var sheetName = book.Worksheets.Item(i + 1).Name;
            if(sheetName != "表紙" && sheetName != "改訂履歴" && sheetName != "TableList" && sheetName != "スクリプト出力について"){
                WScript.Echo("シート "+sheetName+" を処理中...");
                var sheet = book.Worksheets(i + 1);

                file.Write("<table class=\"table table-bordered\">");

                file.Write("<tr>");
                file.Write("<th class=\"active\" colspan=\"6\">");
                file.Write(sheet.Range("C2").Value);
                file.Write("</th>");
                file.Write("<th class=\"active\" colspan=\"5\">");
                file.Write(sheet.Range("G2").Value);
                file.Write("</th>");
                file.Write("</tr>");

                file.Write("<tr>");
                file.Write("<td>フィールド</td>");
                file.Write("<td>フィールド名</td>");
                file.Write("<td>型</td>");
                file.Write("<td>サイズ</td>");
                file.Write("<td>主キー</td>");
                file.Write("<td>ユニークキー</td>");
                file.Write("<td>外部キー</td>");
                file.Write("<td></td>");
                file.Write("<td>必須項目</td>");
                file.Write("<td>既定値</td>");
                file.Write("<td>備考</td>");
                file.Write("</tr>");

                var lastRow = sheet.Cells(sheet.Rows.Count, 2).End(xlUp).Row;

                for(var nowRow = 4; nowRow <= lastRow; nowRow++){
                    file.Write("<tr>");
                    for(var row = 0; row < rowAry.length; row++){
                        var val = sheet.Range(rowAry[row]+nowRow).Value;
                        if(val != undefined){
                            file.Write("<td>"+val+"</td>");
                        }else{
                            file.Write("<td>&nbsp;</td>");
                        }
                    }
                    file.Write("</tr>");
                }
                file.Write("</table>");
                WScript.Echo("シート "+sheetName+" 完了");
            }
        }

        WScript.Echo(fileName + " 処理完了");
        book.Close(false);

        file.Write("</div>");
        file.Write("</div>");
    }

    file.Write("</div>");
    file.Write("</body>");
    file.Write("</html>");

    file.Close();
    excel.Quit();
}

function createExcelOneSheet(){
    if(fso.FileExists(filePath + "dbList.xlsx")){
        fso.DeleteFile(filePath + "dbList.xlsx", true);
    }

    var excel = new ActiveXObject("Excel.Application");
    var valAry = [];
    var fileAry = [];
    var sheetNum = 0;

    for(; !enume.atEnd(); enume.moveNext()){
        var fileLists =  enume.item();
        var fileName = fileLists.Name;
        if(fileName.search(/\.xls$/) == -1 || fileName == "データベース仕様書-雛形.xls"){
            continue;
        }
        WScript.Echo(fileName + " 処理中...");
        var book = excel.Workbooks.Open(path + "\\" + fileName, true, true);
        valAry[sheetNum] = [];
        fileAry[sheetNum] = fileName;
        var tNum = 0;

        for(var i = 0; i < book.Worksheets.Count; i++){
            var sheetName = book.Worksheets.Item(i + 1).Name;
            if(sheetName != "表紙" && sheetName != "改訂履歴" && sheetName != "TableList" && sheetName != "スクリプト出力について"){
                valAry[sheetNum][tNum] = {};

                WScript.Echo("シート "+sheetName+" を処理中...");
                var sheet = book.Worksheets(i + 1);

                valAry[sheetNum][tNum]['tableName'] = sheet.Range("C2").Value;
                valAry[sheetNum][tNum]['tablePName'] = sheet.Range("G2").Value;

                var lastRow = sheet.Cells(sheet.Rows.Count, 2).End(xlUp).Row;

                valAry[sheetNum][tNum]['fields'] = [];

                var j = 0;
                var k = 0;

                for(var nowRow = 4; nowRow <= lastRow; nowRow++){
                    valAry[sheetNum][tNum]['fields'][j] = [];
                    k = 0;
                    for(var row = 0; row < rowAry.length; row++){
                        var val = sheet.Range(rowAry[row]+nowRow).Value;
                        if(val != undefined){
                            valAry[sheetNum][tNum]['fields'][j][k] = val;
                        }else{
                            valAry[sheetNum][tNum]['fields'][j][k] = '';
                        }
                        k += 1;
                    }
                    j += 1;
                }
                WScript.Echo("シート "+sheetName+" 完了");
                tNum += 1;
            }

        }

        WScript.Echo(fileName + " 処理完了");
        book.Close(false);
        sheetNum += 1;
    }

    WScript.Echo("Excel作成開始します...");

    excel.Visible = true;
    excel.WorkBooks.Add();
    var book = excel.Workbooks(1);

    book.WorkSheets(1).Activate();
    excel.ActiveWindow.Zoom = 85;

    var sheet = book.WorkSheets(1);
    sheet.Name = "データベース一覧";


    var col = 1;
    var row = 1;

    for(var fi = 0; fi < valAry.length; fi++){
        var sheetName = fileAry[fi].match(/.*_(.*_.*)\.xls/);
        WScript.Echo(sheetName[1] + " 処理中...");

        for(var col = 0; col < header.length; col++){
            sheet.Cells(row,col+1).Value = header[col];
        }
        var bs = sheet.Range(sheet.Cells(row,1),sheet.Cells(row,header.length)).Interior.ColorIndex = 20;
        row += 1;

        for(var st = 0; st < valAry[fi].length; st++){
            sheet.Cells(row,1).Value = valAry[fi][st]['tableName'];
            sheet.Cells(row,2).Value = valAry[fi][st]['tablePName'];

            for(var x = 0; x < valAry[fi][st]['fields'].length; x++){
                col = 3;
                for(var y = 0; y < valAry[fi][st]['fields'][x].length; y++){
                    sheet.Cells(row,col).Value = valAry[fi][st]['fields'][x][y];
                    col += 1;
                }
                row += 1;
            }
        }

        WScript.Echo(sheetName[1] + " 処理完了");
    }

    var bs = sheet.Range(sheet.Cells(1,1),sheet.Cells(row-1,col-1)).Borders;
    bs.LineStyle = 1;
    bs.Weight = 2;
    sheet.Columns("A:D").AutoFit;
    sheet.Columns("M").AutoFit;

    excel.DisplayAlerts = false;
    book.SaveAs(filePath + "dbList.xlsx");

    book.Close();
    excel.Quit();
}

function createExcelSeparateSheet(){
    if(fso.FileExists(filePath + "dbListSeparate.xlsx")){
        fso.DeleteFile(filePath + "dbListSeparate.xlsx", true);
    }

    var excel = new ActiveXObject("Excel.Application");
    var valAry = [];
    var fileAry = [];
    var sheetNum = 0;

    for(; !enume.atEnd(); enume.moveNext()){
        var fileLists =  enume.item();
        var fileName = fileLists.Name;
        if(fileName.search(/\.xls$/) == -1 || fileName == "データベース仕様書-雛形.xls"){
            continue;
        }
        WScript.Echo(fileName + " 処理中...");
        var book = excel.Workbooks.Open(path + "\\" + fileName, true, true);
        valAry[sheetNum] = [];
        fileAry[sheetNum] = fileName;
        var tNum = 0;

        for(var i = 0; i < book.Worksheets.Count; i++){
            var sheetName = book.Worksheets.Item(i + 1).Name;
            if(sheetName != "表紙" && sheetName != "改訂履歴" && sheetName != "TableList" && sheetName != "スクリプト出力について"){
                valAry[sheetNum][tNum] = {};

                WScript.Echo("シート "+sheetName+" を処理中...");
                var sheet = book.Worksheets(i + 1);

                valAry[sheetNum][tNum]['tableName'] = sheet.Range("C2").Value;
                valAry[sheetNum][tNum]['tablePName'] = sheet.Range("G2").Value;

                var lastRow = sheet.Cells(sheet.Rows.Count, 2).End(xlUp).Row;

                valAry[sheetNum][tNum]['fields'] = [];

                var j = 0;
                var k = 0;

                for(var nowRow = 4; nowRow <= lastRow; nowRow++){
                    valAry[sheetNum][tNum]['fields'][j] = [];
                    k = 0;
                    for(var row = 0; row < rowAry.length; row++){
                        var val = sheet.Range(rowAry[row]+nowRow).Value;
                        if(val != undefined){
                            valAry[sheetNum][tNum]['fields'][j][k] = val;
                        }else{
                            valAry[sheetNum][tNum]['fields'][j][k] = '';
                        }
                        k += 1;
                    }
                    j += 1;
                }
                WScript.Echo("シート "+sheetName+" 完了");
                tNum += 1;
            }

        }

        WScript.Echo(fileName + " 処理完了");
        book.Close(false);
        sheetNum += 1;
    }

    WScript.Echo("Excel作成開始します...");

    excel.Visible = true;
    excel.WorkBooks.Add();
    var book = excel.Workbooks(1);
    var addSheetNum = fileAry.length - excel.WorkSheets.Count;
    excel.WorkSheets.Add(null,excel.WorkSheets(excel.WorkSheets.Count),addSheetNum);


    for(var fi = 0; fi < valAry.length; fi++){
        book.WorkSheets(fi + 1).Activate();
        excel.ActiveWindow.Zoom = 85;

        var sheet = book.WorkSheets(fi + 1);
        var sheetName = fileAry[fi].match(/.*_(.*_.*)\.xls/);
        sheet.Name = sheetName[1];

        for(var col = 0; col < header.length; col++){
            sheet.Cells(1,col+1).Value = header[col];
        }
        var bs = sheet.Range(sheet.Cells(1,1),sheet.Cells(1,header.length)).Interior.ColorIndex = 20;

        WScript.Echo(sheetName[1] + " 処理中...");

        var col = 1;
        var row = 2;

        for(var st = 0; st < valAry[fi].length; st++){
            sheet.Cells(row,1).Value = valAry[fi][st]['tableName'];
            sheet.Cells(row,2).Value = valAry[fi][st]['tablePName'];

            for(var x = 0; x < valAry[fi][st]['fields'].length; x++){
                col = 3;
                for(var y = 0; y < valAry[fi][st]['fields'][x].length; y++){
                    sheet.Cells(row,col).Value = valAry[fi][st]['fields'][x][y];
                    col += 1;
                }
                row += 1;
            }
        }

        var bs = sheet.Range(sheet.Cells(1,1),sheet.Cells(row-1,col-1)).Borders;
        bs.LineStyle = 1;
        bs.Weight = 2;
        sheet.Columns("A:D").AutoFit;
        sheet.Columns("M").AutoFit;

        WScript.Echo(sheetName[1] + " 処理完了");
    }
    excel.DisplayAlerts = false;
    book.SaveAs(filePath + "dbListSeparate.xlsx");

    book.Close();
    excel.Quit();
}

function createText(){
    if(fso.FileExists(filePath + "db_list.txt")){
        fso.DeleteFile(filePath + "db_list.txt", true);
    }

    var file = fso.OpenTextFile(filePath + "db_list.txt", 8, true, 0);

    var excel = new ActiveXObject("Excel.Application");

    for(; !enume.atEnd(); enume.moveNext()){
        var fileLists =  enume.item();
        var fileName = fileLists.Name;
        if(fileName.search(/\.xls$/) == -1 || fileName == "データベース仕様書-雛形.xls"){
            continue;
        }
        WScript.Echo(fileName + " 処理中...");
        var book = excel.Workbooks.Open(path + "\\" + fileName, true, true);
        file.Write(fileName+"\n\n");


        for(var i = 0; i < book.Worksheets.Count; i++){
            var sheetName = book.Worksheets.Item(i + 1).Name;
            if(sheetName != "表紙" && sheetName != "改訂履歴" && sheetName != "TableList" && sheetName != "スクリプト出力について"){
                WScript.Echo("シート "+sheetName+" を処理中...");
                var sheet = book.Worksheets(i + 1);

                file.Write("\n");
                file.Write(sheet.Range("C2").Value);
                file.Write("\t"+sheet.Range("G2").Value+"\n");

                file.Write("フィールド");
                file.Write("\tフィールド名");
                file.Write("\t型");
                file.Write("\tサイズ");
                file.Write("\t主キー");
                file.Write("\tユニークキー");
                file.Write("\t外部キー");
                file.Write("\t必須項目");
                file.Write("\t既定値");
                file.Write("\t備考\n");

                var lastRow = sheet.Cells(sheet.Rows.Count, 2).End(xlUp).Row;

                for(var nowRow = 4; nowRow <= lastRow; nowRow++){
                    for(var row = 0; row < rowAry.length; row++){
                        var val = sheet.Range(rowAry[row]+nowRow).Value;
                        if(val != undefined){
                            if(row != 0 && row < (rowAry.length - 1)){
                                file.Write("\t");
                            }else{
                                // file.Write("\t\t");
                            }
                            file.Write(val);
                        }else{
                            if(row != 0 && row < (rowAry.length - 1)){
                                file.Write("\t-");
                            }else{
                                // file.Write("\t\t ");
                            }
                        }
                    }
                    file.Write("\n");
                }
                WScript.Echo("シート "+sheetName+" 完了");
            }
        }

        WScript.Echo(fileName + " 処理完了");
        book.Close(false);
    }

    file.Close();
    excel.Quit();
}

WScript.Echo("長寿リポジトリを指定してください");
cyoPath = WScript.StdIn.ReadLine();
path = cyoPath + path;

WScript.Echo("作成するファイル位置を指定してください");
WScript.Echo("1:バッチファイルと同じ 2:データベース仕様書と同じ");
location = WScript.StdIn.ReadLine();

switch(location){
    case '1':
        filePath = batchPath;
    break;
    case '2':
        filePath = cyoPath + path + "\\";
    break;
    default:
        filePath = batchPath;
    break;
}

var files =  fso.GetFolder(path).Files;
var enume = new Enumerator(files);
var sheetNames = "";
var xlUp = -4162;

while(true){
    var kind = '';
    var flag = false;
    WScript.Echo("1:html 2:excel(1シートに全て記載) 3:excel(ファイル毎にシート分割) 4:テキスト 5:quit");
    kind = WScript.StdIn.ReadLine();
    switch(kind){
        case '1':
            createHtml();
            flag = true;
        break;
        case '2':
            createExcelOneSheet();
            flag = true;
        break;
        case '3':
            createExcelSeparateSheet();
            flag = true;
        break;
        case '4':
            createText();
            flag = true;
        break;
        case '5':
            flag = true;
        break;
        default:
            WScript.Echo("1-4 の数値を入力してください");
        continue;
    }
    if(flag){
        break;
    }
}

WScript.Quit();
