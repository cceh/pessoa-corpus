
xquery version "3.1";

declare namespace tei = "http://www.tei-c.org/ns/1.0";

let $folderPath := "\..\data\pub" 

let $fileInfos := for $file in collection(concat($folderPath, '?select=*.xml;recurse=yes'))
    let $doc := $file
    return
        <item xmlns="http://www.tei-c.org/ns/1.0" xml:id="{ $doc/tei:TEI/tei:teiHeader[1]/tei:fileDesc[1]/tei:publicationStmt[1]/tei:idno[1]/text() }">
            <title>{ $doc/tei:TEI/tei:teiHeader[1]/tei:fileDesc[1]/tei:titleStmt[1]/tei:title[1]/text() }</title>
        </item>

return
<TEI xmlns="http://www.tei-c.org/ns/1.0">
    <teiHeader>
        <fileDesc>
            <titleStmt>
                <title>Digital Edition of Fernando Pessoa - Project Knowledge</title>
            </titleStmt>
            <publicationStmt>
                <p>Publication Information</p>
            </publicationStmt>
            <sourceDesc>
                <p>Born digital.</p>
            </sourceDesc>
        </fileDesc>
    </teiHeader>
    <text>
        <body>
            <div xml:id="pubindex">
                <list type="publications"> 
                    {$fileInfos}
                </list>
            </div>
        </body>
    </text>
</TEI>

