# Tested

- SimpleStorage:

  1. la get è sempre corretta
  2. la set è corretta tranne se il parametro è pari a 0 poiché in quel caso la EVM da un refund di 15000 di gas alla fine della transazione perché si è resettato il valore a zero.
     Questo caso non è però prevedibile poiché non possiamo sapere quale sarà l'input ma i costi rimangono comunque corretti poiché rimangono un upper bound del caso pessimo

- ViewAndPure: in seguito al test ho modificato l'esempio aggiungendo 2 nuove funzioni che differiscono dalle 2 già presenti per il fatto che le operazioni artitmetiche sono effettuate all'interno di un blocco "unchecked". In questo modo è possibile osservare come nel caso delle varianti unchecked i costi corrispondano esattamente a quelli dell'esecuzione reale (poiché non vengono aggiunti ulteriori controlli) mentre quelli delle versioni "checked" risultano essere un upper bound (pertanto rimangono corretti) di quelli reali poiché non è possibile prevedere quali controlli verranno superati e quali no.

- Visibility:
  - Le funzioni base di A (setData e getData) sono corrette.
  - I getter di data e withGetter non hanno una label associata, probabilmente è un problema
  - x() richiede ulteriori approfondimenti
  - la funzione g() di B è invece completamente sbagliata ma ciò è probabilmente dovuto alla creazione di un nuovo contratto il cui costo è difficilmente calcolabile (richiede cmq ulteriori approfondimenti)
