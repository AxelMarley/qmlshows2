import QtQuick 2.0
import QtQuick.LocalStorage 2.0 as Sql

Rectangle {
    id: main
    width: 640
    height: 480
    color: "#ff9000"
    property var shows
    property var unwatchedEpisodes
    property var isLogged
    property var request


    VisualItemModel {
        id: itemModel
        Rectangle {
            height: 480
            width: 320
            antialiasing: true

            Image {
                id: background1
                source: "Images/1_01.png"
                width: parent.width
                height: parent.height
                fillMode: Image.PreserveAspectCrop
            }
            Rectangle {
                color: "#00000000"
                border.color: "black"
                border.width: 0
                height: 46
                antialiasing: true
                radius: 20

                anchors.top: parent.top
                anchors.topMargin: 148

                anchors.left: parent.left
                anchors.leftMargin: 55

                anchors.right: parent.right
                anchors.rightMargin: 50

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter + 10

                id: loginRect
                TextEdit {
                    id: loginBox
                    text: qsTr("")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    width: parent.width
                    height: parent.height
                    font.family: "Impact"
                    font.pixelSize: 26
                    color: "black"
                    selectByMouse: true
                }
            }

            Rectangle {
                color: "#00000000"
                border.color: "black"
                border.width: 0
                height: 46
                antialiasing: true
                radius: 20
                anchors.top: loginRect.bottom
                anchors.topMargin: 33

                anchors.left: parent.left
                anchors.leftMargin: 55

                anchors.right:  parent.right
                anchors.rightMargin: 50

                anchors.horizontalCenter: parent.horizontalCenter

                id: passRect
                TextInput {
                    id: passBox
                    text: qsTr("")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    width: parent.width
                    height: parent.height
                    font.pixelSize: 26
                    font.family: "Impact"
                    color: "black"
                    selectByMouse: true
                    echoMode: TextInput.Password
                    passwordCharacter: "•"
                }

            }

            Rectangle {
                color: "#000000"
                width: 100
                antialiasing: true
                height: 25
                border.color: "black"
                border.width: 1
                anchors.top: passRect.bottom
                anchors.topMargin: 15
                anchors.horizontalCenter: parent.horizontalCenter
                radius: 20
                MouseArea {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.fill: parent
                    onClicked: {
                        login(loginBox.text, passBox.text)
                    }
                    Text {
                        id: apply
                        font.pixelSize: 16
                        color: "#ff9000"
                        anchors.fill: parent
                        font.family: "Impact"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        text: qsTr("submit")
                    }
                }
            }

            Rectangle {
                id: messageBox
                color: "#00000000"
                width: parent.width
                height: parent.height
                antialiasing: true
                visible: false

                Image{
                    id: messageBoxImage
                    //source: "Images/ErrorView.png"
                    width: parent.width
                    height: parent.height
                    fillMode: Image.PreserveAspectCrop
                }
                MouseArea
                {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.fill: parent
                    onClicked: {hideMessage()
                    }
                }

            }
        }
        Rectangle {
            antialiasing: true
            height: 480
            width: 320
            color: "#90f076"

            Image {
                id: background2
                width: parent.width
                height: parent.height
                fillMode: Image.PreserveAspectCrop
                source: "Images/1_02.png"
                }

            Row {
                id: searchLine
                anchors.top: parent.top
                anchors.topMargin: 10


                Rectangle {
                    color:"#9Affffff"
                    border.color: "black"
                    border.width: 1
                    width: 234
                    height: 25
                    smooth: true
                    radius: 15
                    antialiasing: true
                    anchors.topMargin: 30

                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    id: searchRect
                    TextEdit {
                        id: searchBox
                        text: qsTr("game of thrones")
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        width: parent.width
                        height: parent.height
                        font.pixelSize: 16
                        font.family: "Impact"
                        color: "black"
                        selectByMouse: true
                    }
                }

                Rectangle {
                    color: "#000000"
                    width: 70
                    height: 25
                    border.width: 1
                    radius: 15
                    antialiasing: true
                    anchors.left: searchRect.right
                    anchors.leftMargin:-15
                    MouseArea {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.fill: parent
                        onClicked: {
                            searchShows(searchBox.text)
                        }
                        Text {
                            id: searcher
                            font.pixelSize: 16
                            font.family: "Impact"
                            color: "#ff9000"
                            anchors.fill: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: qsTr("search")
                        }
                    }
                }
            }
            ListView {
                id: showView
                anchors.top: searchLine.bottom
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.margins: 30
                model: shows
                spacing: 0

                delegate: Rectangle {
                    width: showView.width
                    height: 50
                    antialiasing: true
                    opacity: 0.3
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: 'white'
                    border {
                        color: 'lightgray'
                        width: 2
                    }
                    radius: 5

                    Row {
                        anchors.margins: 5
                        anchors.fill: parent
                        spacing: 2
// image
                        Rectangle {
                            height: parent.height
                            width: 50
                            Image {
                                height: parent.height
                                width: parent.width
                                fillMode: Image.PreserveAspectFit
                                source: modelData["image"]
                            }
                        }
                        Text {
                            width: parent.width
                            anchors.verticalCenter: parent.verticalCenter
                            font.family: "Impact"
                            font.pixelSize: 16
                            elide: Text.ElideRight
                            renderType: Text.NativeRendering
                            text: "%1 — %2".arg(modelData['title']).arg(
                                      modelData['year'])
                        }
                    }
                }
            }
        }
        Rectangle {
            height: 480
            width: 320
            anchors.rightMargin: 5
            antialiasing: true

            Image {
                id: background3
                source: "Images/1_03.png"
                width: parent.width
                height: parent.height
                fillMode: Image.PreserveAspectCrop
            }
            Rectangle {
                color: "black"
                width: 150
                antialiasing: true
                height: 25
                border.color: "black"
                border.width: 1
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                radius: 15
                id: rldRectangle
                MouseArea {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.fill: parent
                    onClicked: {
                        getUnwatched()
                    }

                    Text {
                        id: reloadUnwatched
                        font.pixelSize: 16
                        font.family: "Impact"
                        color:"#ff9000"
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        text: qsTr("Reload")
                    }
                }
            }

            ListView {
                id: unwatchedList
                anchors.top: rldRectangle.bottom
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.margins: 25
                spacing: 0
                model: unwatchedEpisodes

                delegate: Rectangle {
                    width: showView.width
                    antialiasing: true
                    height: 30
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: 'white'
                    opacity: 0.3
                    border {
                        color: 'lightgray'
                        width: 1
                    }
                    radius: 5

                    Rectangle {
                        anchors.margins: 5
                        anchors.fill: parent
                        opacity: 1
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                singleCheck(modelData['episodeId']);
                            }
                        Text {
                            width: parent.width
                            font.family: "Impact"
                            font.pixelSize: 16
                            anchors.verticalCenter: parent.verticalCenter
                            elide: Text.ElideRight
                            renderType: Text.NativeRendering
                            text: "%1 [%2,ep. %3.%4]".arg(
                                      modelData['title']).arg(
                                      modelData['airDate']).arg(
                                      modelData['seasonNumber']).arg(
                                      modelData['episodeNumber'])
                        }
                            }
                    }
                }
            }
        }

    }

    ListView {
        id: view
        highlightMoveDuration: 150
        keyNavigationWraps: true
        snapMode: ListView.SnapOneItem
        boundsBehavior: Flickable.DragOverBounds
        anchors.fill: parent
        model: itemModel
        orientation: ListView.Horizontal

    }


    Item {
        Timer {
            interval: 600000; running: true; repeat: true
            onTriggered:  {request = new XMLHttpRequest()

                var result

                request.onreadystatechange = function () {
                    if (request.readyState === XMLHttpRequest.DONE) {
                        if (request.status && request.status === 200) {

                            var db = Sql.LocalStorage.openDatabaseSync("EpisodeDB", "1.0",
                                                                       "myshows data", 1000000)
                            var string = ""
                            db.transaction(function (tx) {

                                var rs = tx.executeSql('SELECT * FROM EPISODE')
                                result = ""
                                for (var i = 0; i < rs.rows.length; i++) {
                                    result = rs.rows.item(i).episodeID
                                    singleCheck(result)
                                }

                            })


                        }
                    }
                }

            }
        }

        Text { id: time }
    }


    Component.onCompleted: {
        isLogged = false
        request = new XMLHttpRequest()
        var db = Sql.LocalStorage.openDatabaseSync("UserDB", "1.0",
                                                   "myshows data", 1000000)
        db.transaction(function (tx) {
            tx.executeSql(
                        'CREATE TABLE IF NOT EXISTS User(login TEXT, pass TEXT)')
            var rs = tx.executeSql('SELECT * FROM User')
            loginBox.text = rs.rows.item(0).TEXT
            passBox.text = rs.rows.item(0).pass
        })
        login(loginBox.text, passBox.text)
    }

    function searchInDb(name) {
        var db = Sql.LocalStorage.openDatabaseSync("MyShowsDB", "1.0", "WAARGH!", 1000000)
        db.transaction(function (tx) {
            tx.executeSql(
                        "CREATE TABLE IF NOT EXISTS Shows(name TEXT, image TEXT, year INTEGER)")
            var rs = tx.executeSql(
                        "SELECT DISTINCT name,image,year FROM Shows WHERE name LIKE \"%" + name + "%\"")
            main.shows = []
            for (var i = 0; i < rs.rows.length; i++) {
                var item = new Object
                item.title=rs.rows.item(i).name
                item.image=rs.rows.item(i).image
                item.year=rs.rows.item(i).year
                main.shows.push(item)

            }
        })
    }

    function writeInDb(show) {
        var db = Sql.LocalStorage.openDatabaseSync("MyShowsDB", "1.0", "WAARGH!", 1000000)
        db.transaction(function (tx) {
            tx.executeSql(
                        "CREATE TABLE IF NOT EXISTS Shows(name TEXT, image TEXT, year INTEGER)")
                tx.executeSql(
                    "INSERT INTO Shows(name,image,year) VALUES (\""+show["title"]+"\",\""+show["image"]+"\","+show["year"]+")")
        })
    }

    function containsName(a, obj) {
        for (var i = 0; i < a.length; i++) {
            if (a[i].title === obj)
            {
                return true;
            }
            else{
                return false;
        }

        }}

    function searchShows(name) {
        searchInDb(name)
        showView.model = shows

        request = new XMLHttpRequest()
        var url = "http://api.myshows.ru/shows/search/?q=" + name
        request.open('GET', url)
        request.onreadystatechange = function () {
            if (request.readyState === XMLHttpRequest.DONE) {
                if (request.status && request.status === 200) {
                    var result = JSON.parse(request.responseText)
                    for (var show in result) {
                        var item = result[show]
//                        shows.push(item)
                        if (!contains(shows,item.title))
                        {
                            shows.push(item)
                            writeInDb(item)
                        }
                    }
                    showView.model = shows }
//                else
//                {
//                    searchInDb(name)
//                    showView.model = shows
//                    console.log("HTTP:", request.status, request.statusText)
//                }
            }
            else
            {
                searchInDb(name)
                showView.model = shows
                console.log("HTTP:", request.status, request.statusText)
            }
        }
        request.setRequestHeader('Content-Type',
                                 'application/x-www-form-urlencoded')
        request.send()
    }




    //мой переделанный (рабочий)

//    function searchShows(name) {
//        searchInDb(name)
//        request = new XMLHttpRequest()
//        var url = "http://api.myshows.ru/shows/search/?q=" + name
//        request.open('GET', url)
//        request.onreadystatechange = function () {
//            if (request.readyState === XMLHttpRequest.DONE) {
//                if (request.status && request.status === 200) {
//                    var result = JSON.parse(request.responseText)
//                    for (var show in result) {
//                        var item = result[show]
//                        shows.push(item)
//                        writeInDb(item)
//                        if (!contains(shows,item.title))
//                        {
//                            shows.push(item)
//                            writeInDb(item)
//                        }
//                    }
//                    showView.model = shows
//                } else {
//                    console.log("HTTP:", request.status, request.statusText)
//                }

    //исходный
//        function searchShows(name) {
//            var url = "http://api.myshows.ru/shows/search/?q=" + name
//            request.open('GET', url)
//            request.onreadystatechange = function () {
//                if (request.readyState === XMLHttpRequest.DONE) {
//                    if (request.status && request.status === 200) {
//                        var result = JSON.parse(request.responseText)
//                        main.shows = []
//                        for (var show in result) {
//                            var item = result[show]
//                            shows.push(item)
//                        }
//                        showView.model = shows
//                    } else {
//                        console.log("HTTP:", request.status, request.statusText)
//                    }
//                }
//            }
//            request.setRequestHeader('Content-Type',
//                                     'application/x-www-form-urlencoded')
//            request.send()
//        }

    function getUnwatchedFromDb()
    {
        var eps = []
        var db = Sql.LocalStorage.openDatabaseSync("UnwatchedDB", "1.0",
                                                   "myshows data", 1000000);
        db.transaction(function (tx) {
            tx.executeSql(
                         'CREATE TABLE IF NOT EXISTS unEp(title TEXT, airDate TEXT, seasonNumber TEXT,episodeNumber TEXT)')
            var rs = tx.executeSql("SELECT DISTINCT * FROM unEp")
            for (var x=0;x<rs.rows.length;x++)
            {
                var ep = new Object;
                ep.title = rs.rows[x].title
                ep.airDate = rs.rows[x].airDate
                ep.seasonNumber = rs.rows[x].seasonNumber
                ep.episodeNumber = rs.rows[x].seasonNumber
                eps.push(ep)
            }
        })
        return eps;
    }

    function getUnwatched() {
        request = new XMLHttpRequest()
        var eps = getUnwatchedFromDb()
        unwatchedList.model = eps
        var url = "http://api.myshows.ru/profile/episodes/unwatched/"
        request.open('GET', url)
        request.onreadystatechange = function () {
            if (request.readyState === XMLHttpRequest.DONE) {
                if (request.status && request.status === 200) {

                    var result = JSON.parse(request.responseText)
                    unwatchedEpisodes = []
                    for (var episode in result) {
                        var item = result[episode]
                        unwatchedEpisodes.push(item)
                    }
                    //unwatchedList.model = unwatchedEpisodes


                    var db = Sql.LocalStorage.openDatabaseSync("UnwatchedDB", "1.0",
                                                               "myshows data", 1000000)
                    db.transaction(function (tx) {
                       tx.executeSql(
                                    'CREATE TABLE IF NOT EXISTS unEp(title TEXT, airDate TEXT, seasonNumber TEXT,episodeNumber TEXT)')


                        for (var episode in unwatchedEpisodes)
                        {var item = unwatchedEpisodes[episode]

                        tx.executeSql('INSERT INTO unEp VALUES(?,?,?,?)',
                                      [item["title"],item["airDate"],item["seasonNumber"],
                                       item["episodeNumber"]])
                    }

                        //    tx.executeSql('DELETE FROM unEp')
                    }
                   )
                } else {
                    console.log(request.status, request.statusText)
                }
            }
        }
        request.setRequestHeader('Content-Type',
                                 'application/x-www-form-urlencoded')
        request.send()
    }

    function login(name, pass) {
        var url = "http://api.myshows.ru/profile/login?login=%1&password=%2".arg(
                    name).arg(Qt.md5(pass))
        request.open('GET', url)
        request.onreadystatechange = function () {
            if (request.readyState === XMLHttpRequest.DONE) {
                if (request.status && request.status === 200) {

                    messageBoxImage.source = "Images/SuccView.png"
                    isLogged = true
                    saveChanges()
                    getUnwatched()

                    var db = Sql.LocalStorage.openDatabaseSync("EpisodeDB", "1.0",
                                                               "myshows data", 1000000)
                    db.transaction(function (tx) {
                        tx.executeSql(
                                    'CREATE TABLE IF NOT EXISTS EPISODE(episodeID TEXT)')
                       // tx.executeSql('DELETE FROM EPISODE')
                    }
                    )
                } else {
                    messageBoxImage.source = "Images/ErrorView.png"
                    isLogged = false
                    console.log(request.status, request.statusText)
                }
            } else {
                isLogged = false
            }
        }
        request.setRequestHeader('Content-Type',
                                 'application/x-www-form-urlencoded')
        request.send()
        messageBox.visible = true
    }

    function singleCheck(episodeId) {
        var result
        var url = "http://api.myshows.ru/profile/episodes/check/%1".arg(
                    episodeId)

        request.open('GET', url)
        request.onreadystatechange = function () {
            if (request.readyState === XMLHttpRequest.DONE) {
                if (request.status && request.status === 200) {
                   // getUnwatched()

                    var db = Sql.LocalStorage.openDatabaseSync("EpisodeDB", "1.0",
                                                               "myshows data", 1000000)
                    db.transaction(function (tx) {

                        tx.executeSql('INSERT INTO EPISODE VALUES(?)',
                                      [episodeId])
                        var rs = tx.executeSql('SELECT * FROM EPISODE')
                        result = ""
                        for (var i = 0; i < rs.rows.length; i++) {
                            result += rs.rows.item(i).episodeID
                        }
                    }
                    )
                    itemModel.children.mapToItem(1)
                } else {


                }
            }
        }
        request.setRequestHeader('Content-Type',
                                 'application/x-www-form-urlencoded')
        request.send()
    }

    function hideMessage(){
        messageBox.visible= false
    }

    function saveChanges() {
        var db = Sql.LocalStorage.openDatabaseSync("UserDB", "1.0",
                                                   "myshows data", 1000000)
        db.transaction(function (tx) {
            tx.executeSql(
                        'CREATE TABLE IF NOT EXISTS User( TEXT, pass TEXT)')
            tx.executeSql('DELETE FROM User')
            tx.executeSql('INSERT INTO User VALUES(?, ?)',
                          [loginBox.text, passBox.text])
            var rs = tx.executeSql('SELECT * FROM User')
            var r = ""
            for (var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).login + ", " + rs.rows.item(i).pass
            }
        }
        )
    }
}
