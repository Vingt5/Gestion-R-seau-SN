#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QApplication>
#include <QMainWindow>
#include <QVBoxLayout>
#include <QComboBox>
#include <QTableView>
#include <QPushButton>
#include <QInputDialog>
#include <QModelIndex>
#include <QSqlQueryModel>
#include <QtSql>


MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    // Connexion à la base de données
    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("localhost");
    db.setDatabaseName("gestionreseau");
    db.setUserName("root");
    db.setPassword("");

    if (!db.open()) {
        qDebug() << "Erreur de connexion à la base de données:" << db.lastError().text();
        return;
    }

    // Création du menu déroulant pour sélectionner la table
    tableComboBox = new QComboBox(this);
    tableComboBox->addItem("etatcadenas");
    tableComboBox->addItem("humidite");
    tableComboBox->addItem("interventions");
    tableComboBox->addItem("machines");
    tableComboBox->addItem("monitoringserver");
    tableComboBox->addItem("notifications");
    tableComboBox->addItem("temperature");
    tableComboBox->addItem("tickets");
    tableComboBox->addItem("utilisateurs");

    // Création du modèle pour afficher les données de la table sélectionnée
    tableModel = new QSqlQueryModel(this);
    tableView = new QTableView(this);
    tableView->setModel(tableModel);

    // Autoriser la sélection d'une seule ligne dans le QTableView
    tableView->setSelectionMode(QAbstractItemView::SingleSelection);

    // Connexion du menu déroulant à la fonction de mise à jour des données
    connect(tableComboBox, QOverload<int>::of(&QComboBox::activated), this, &MainWindow::updateTable);

    // Connexion du signal clicked du QTableView à la fonction cellClicked
    connect(tableView, &QTableView::clicked, this, &MainWindow::cellClicked);

    // Connexion du signal de changement de sélection du QTableView à la fonction tableSelectionChanged
    connect(tableView->selectionModel(), &QItemSelectionModel::selectionChanged, this, &MainWindow::tableSelectionChanged);

    // Configuration de la mise en page
    QVBoxLayout *layout = new QVBoxLayout(ui->centralwidget);
    layout->addWidget(tableComboBox);
    layout->addWidget(tableView);
    ui->centralwidget->setLayout(layout);

    // Création du bouton de mise à jour du statut du ticket
    updateButton = new QPushButton("Mettre à jour le statut", this);

    // Connecter le signal clicked du bouton à la fonction updateTicketStatus
    connect(updateButton, &QPushButton::clicked, this, &MainWindow::updateTicketStatus);

    // Ajouter le bouton à la fenêtre principale
    layout->addWidget(updateButton);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::updateTable(int index) {
    QString tableName = tableComboBox->itemText(index);
    QSqlQuery query("SELECT * FROM " + tableName);
    tableModel->setQuery(query);

    // Masquer la colonne d'index
    tableView->hideColumn(0);

    tableView->resizeColumnsToContents();
}

void MainWindow::cellClicked(const QModelIndex &index) {
    // Vérifier si la colonne cliquée correspond à celle du statut des tickets
    if (index.column() == 4) { // Supposant que la colonne du statut des tickets est la cinquième colonne
        // Afficher une boîte de dialogue contextuelle pour choisir un nouveau statut
        QStringList statusOptions = {"en attente", "en cours", "résolu"};
        QString currentStatus = index.data().toString();
        QString newStatus = QInputDialog::getItem(this, "Changer le statut", "Nouveau statut:", statusOptions, 0, false);

        if (!newStatus.isEmpty()) {
            // Mettre à jour la base de données avec le nouveau statut sélectionné
            int ticketId = tableModel->data(tableModel->index(index.row(), 0)).toInt(); // Supposant que la première colonne est l'ID du ticket
            QSqlQuery query;
            query.prepare("UPDATE tickets SET Statut = :newStatus WHERE ID_ticket = :ticketId");
            query.bindValue(":newStatus", newStatus);
            query.bindValue(":ticketId", ticketId);
            if (!query.exec()) {
                qDebug() << "Erreur lors de la mise à jour du statut du ticket:" << query.lastError().text();
                return;
            }
            // Rafraîchir les données affichées dans le tableau
            updateTable(tableComboBox->currentIndex());
        }
    }
}

void MainWindow::tableSelectionChanged(const QItemSelection &selected) {
    // Implémentation de la logique pour le changement de sélection dans le tableau
    // Vous pouvez accéder aux index sélectionnés en utilisant selected.indexes()
    // Par exemple :
    QModelIndexList indexes = selected.indexes();
    foreach (const QModelIndex &index, indexes) {
        // Votre logique ici...
    }
}

void MainWindow::updateTicketStatus() {
    // Logique pour mettre à jour le statut du ticket
}
