# QTinyAes
A Qt-Wrapper for the AES-implementation kokke/tiny-AES-C (supports AES128/192/256)

This class is simply a wrapper for https://github.com/kokke/tiny-AES-C. It allows to use the simple AES-implementation inside Qt and with Qt's `QByteArray` class. Thanks to recent updates, allowing keys of size 128, 192 and 256.

## Features
 - It's a C++-class instead of just C-functions
 - Easy integration with Qt-Projects thanks to the use of QByteArray
 - Allows plain-texts of any size - [PKCS#7 Padding](https://en.wikipedia.org/wiki/Padding_(cryptography)#PKCS7) is added automatically
 - Supports all common AES keysizes (compile-time switch)
 - Currently supports CTR, CBC and ECB as modes

## Installation
The package is provided via qdep, as `Skycoder42/QTinyAes`. To use it simply:

1. Install and enable qdep (See [qdep - Installing](https://github.com/Skycoder42/qdep#installation)
2. Add the following to your pro file:
```qmake
QDEP_DEPENDS += Skycoder42/QTinyAes
!load(qdep):error("Failed to load qdep feature! Run 'qdep.py prfgen --qmake $$QMAKE_QMAKE' to create it.")
```

## Example
```cpp
QTinyAes aes;

aes.setMode(QTinyAes::CTR);
aes.setKey("randomkey_256bit");// QTinyAes::KeySize (256 bit key by default)
//or with Qt 5.10
aes.setKey(QTinyAes::generateKey());
aes.setIv("random_iv_128bit");// QTinyAes::BlockSize (128 iv vector)

QByteArray plain = "Hello World";
qDebug() << "plain:" << plain
QByteArray cipher = aes.encrypt(plain);
qDebug() << "cipher:" << cipher;
QByteArray result = aes.decrypt(cipher);
qDebug() << "result:" << result;
```

## Changing the key size
By default, your keys must be 256 bit keys. However, you can change this size to 192 or 128 if you need to. This can be done via a qmake variable, as the keysize as a **compile time** switch (due to limitations of kokke/tiny-AES-C).

To change the size, set the `TINYAES_KEYSIZE` qmake variable to the desired keysize *before* loading the qdep feature

```pro
TINYAES_KEYSIZE = 128  # or 192 or the default, 256

QDEP_DEPENDS += Skycoder42/QTinyAes
!load(qdep):error("Failed to load qdep feature! Run 'qdep.py prfgen --qmake $$QMAKE_QMAKE' to create it.")
```
# myCourseProject
