#pragma once

#include <QObject>

class Vault : public QObject
{
	Q_OBJECT

public:
	static void addDelivery();
	static void abortDelivery();
	static void addDelivier();
	static void abortDelivier();
	static void editProduct();
	static void deleteProduct();
};
