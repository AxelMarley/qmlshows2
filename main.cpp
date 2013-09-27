#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
#include <QtSql>
#include <sys/stat.h>
#include "QNetworkProxy"
#include "QFile"

//////////////////////////

int main(int argc, char *argv[])
{
    QNetworkProxy proxy;
    proxy.setType(QNetworkProxy::HttpProxy);
    proxy.setHostName("172.16.110.60");
    proxy.setPort(2527);
    proxy.setUser("314-5");
    proxy.setPassword("1234567");
    QNetworkProxy::setApplicationProxy(proxy);


    QGuiApplication app(argc, argv);

    QtQuick2ApplicationViewer viewer;

    viewer.setMainQmlFile(QStringLiteral("qrc:/qml/main.qml"));
    viewer.showExpanded();


    //////////////////

        class title
        {
        public:
            title();
            QString country;
            QString ended;
            QString genres;
            int id;
            QString image;
            QString imdbid;
            QString kinopoiskid;
            double rating;
            int runtime;
            QString rutitle;
            QString started;
            QString status;
            QString uktitle;
            int tvrageid;
            int voted;
            int watching;
            int year;
           // QVector<title> titles;
        };


//    QSqlDatabase dbase = QSqlDatabase::addDatabase("QSQLITE");
    QDir file;
//    QString titles;
//    for (int i=0;i<titles.size();i++)
//    {


//        if(QFile::exists(file.absolutePath()+"/my_db.sqlite"))

//        {
//            QSqlDatabase dbase = QSqlDatabase::addDatabase("QSQLITE");
//            dbase.setDatabaseName("my_db.sqlite");
//            if (!dbase.open()) {
//                qDebug() << "Что-то пошло не так!";
//                //return -1;
//            }
//            QSqlQuery a_query;
//            QString str_insert = "INSERT INTO my_table(Title, id, Year, Ended) "
//                    "VALUES ('%1', %2, %3, '%4');";
//            QString str = str_insert.arg(modelData[i].title)
//                    .arg(modelData[i].id)
//                    .arg(modelData[i].year)
//                    .arg(modelData[i].ended);
//            bool b = a_query.exec(str);
//            if (!b) {
//                qDebug() << "Кажется данные не вставляются, проверьте дверь, может она закрыта?";
//            }

//            else
//            {
//             qDebug() << "Создаём базу";
//                QSqlDatabase dbase = QSqlDatabase::addDatabase("QSQLITE");
//                dbase.setDatabaseName("my_db.sqlite");
//                if (!dbase.open()) {
//                    qDebug() << "Что-то пошло не так!";
//                }

//                QSqlQuery a_query;
//                QString str = "CREATE TABLE my_table ("
//                        "Title VARCHAR(255) PRIMARY KEY NOT NULL, "
//                        "id integer, "
//                        "Year integer, "
//                        "Ended VARCHAR(255)"
//                        ");";
//                bool b = a_query.exec(str);
//                if (!b) {
//                    qDebug() << "Вроде не удается создать таблицу, провертье карманы!";
//                }


//            }
    return app.exec();
        }
    //}
//}
//}
