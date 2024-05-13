#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QSqlQueryModel>
#include <QComboBox>
#include <QTableView>
#include <QPushButton>
#include <QVBoxLayout>
#include <QDebug>
#include <QtSql>
#include <QInputDialog>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void updateTable(int index);
    void updateTicketStatus();
    void tableSelectionChanged(const QItemSelection &selected);
    void cellClicked(const QModelIndex &index);

private:
    Ui::MainWindow *ui;
    QSqlQueryModel *tableModel;
    QComboBox *tableComboBox;
    QComboBox *statusComboBox;
    QPushButton *updateButton;
    QTableView *tableView;
};

#endif // MAINWINDOW_H
