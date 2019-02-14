TODO - BlockChain Experimente
---------------------------------------

1. Puppeth anschauen

6. Wieso ist die ContractAddress immer null?
	--> schon geklärt, aber Erklärung fehlt (nachschauen)

2. Ausarbeitung

3. Dapp Review

## DONE

1. Subscription auf dem HTTP-Provider aktivieren (vermutlich geht das per geth Konfig bzw. Command Line)  
	-> HttpProvider unterstützt keine Subscription (daher WS als Provider; Geth Initialisierung muss erweitert werden)  
	-> ~~WS tut sich auch schwer, daher mit IPC~~
	-> IpcProvider funktioniert, weiter mit Subscriptions; contractAddress ist immer noch null
	-> Nutzung des WS Provider

2. geth Konfiguration -> private blockchain setup (BS Node verbindet sich zur Zeit noch in das globale Netzwerk)  
	-> ~~bisher nicht sehr viele Hinweise gefunden (denn unsere networkId ist ja ungleich 1)~~
	-> --nodiscover, bzw. eigenen boot-node angeben
	-> spezifische network id setzen

3. Änderungen des Consensus Model -> Proof of Authority statt Proof of Work  
	-> Genesis-Block hinsichtlich PoA (Clique) geändert, ~~jedoch Fehler: "makeslice: len out of range"~~~ (-> in "extradata" ist mindestens ein "seeder" anzugeben, korrekte Position der Adresse innerhalb des Byte-Array ist zu beachten!)


5. Zweite Dapp schreiben, die Positionsdaten empfängt (via Event-Subscription). Die Dapp kann auch eine einfache Node.js Anwendung sein, die auf der Command Line ausgibt.  
	--> erledigt


