#include "document.h"

void Document::CreateDock()
{
    QAxObject* pWord = new QAxObject("Word.Application");
    QAxObject* pDock = pWord->querySubObject("Documents");
    pDock->querySubObject("Add()");
}
