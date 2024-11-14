# Spielkonzept
- [Spielkonzept](#spielkonzept)
- [Spielkreislauf](#spielkreislauf)
    - [Pflanzen](#pflanzen)
    - [Tiere](#tiere)
    - [Lagern](#lagern)
    - [Verkaufen](#verkaufen)
          - [Auftragsbrett](#auftragsbrett)
          - [Marktplatz](#marktplatz)
- [Systeme](#systeme)
  - [Story](#story)
- [Keymap](#keymap)
        - [W](#w)
        - [A](#a)
        - [S](#s)
        - [D](#d)
        - [E](#e)
        - [F](#f)


# Spielkreislauf

### Pflanzen
Pflanzen werden angbeaut mit einer Pflanze. Beim abbauen bekommt entweder 1, 2 oder 3 Karotten. Wahrscheinlichkeiten: 5% 1 Stück 85% 2 Stück, 10% 3 Stück. Wenn man die Pflanzen gießt steigt die Wahrscheinlich auf 2 oder 3 Stück.

### Tiere
Tiere sollen ähnlich wie Pflanzen betreut werden. Damit Tiere ihre Produkte, wie z.B. bei der Kuh die Milch, produzieren können, benötigen sie Tierfutter. Ob Tiere schlachtbar sind ist noch nicht entschieden.

### Lagern
Die Ernte wird automatisch in die Scheune übertragen. Es gibt kein eigenes Spielerinventar. Die Scheune wir absteigend sortiert. Wenn es von einem Item 0 gibt wird es nicht angezeigt.

### Verkaufen
Es gibt einen Marktplatz und ein Auftragsbrett.
###### Auftragsbrett
Auf diesem werden zufällige Aufträge generiert. Diese geben Geld und Erfahrungspunkte. Die Erfahrungspunkte sind random zwischen bestimmten Werten gebildet aus der Summe der Items aus den ConfigFiles. Diese varieren zufällig. Das Geld verhält sich wie die Erfahungspunkte aber sind weniger Wert als wenn sie auf dem Marktplatz verkauft wird.

###### Marktplatz
Auf dem Marktplatz können Items zu frei wählbaren Preisen verkauft werden. Der minimal Preis beträgt 1 und der maximal Preis beträgt die im ConfigFile angegeben. Am Anfang gibt es vier Slots. Die weiteren Slots können mit Gold erkauft werden. Pro Slot kann maximal ein Item-Typ mit einer Anzahl von 1 bis 10 verkauft werden. Der Marktplatz gibt keine Erfahrungspunkte.

# Systeme
## Story

# Keymap

##### W
Name: move_up
| Benutzt von:
- Player Movement

##### A
Name: move_left
| Benutzt von:
- Player Movement

##### S
Name: move_down
| Benutzt von:
- Player Movement

##### D
Name: move_right
| Benutzt von:
- Player Movement

##### E
Name: interact
Abbauen, Anbauen, Öffnen von Türen
| Benutzt von:
- BasicHaus
- Scheune
- Anbau Feldern

##### F
Name: interact2
Momentan mit interact2 belegt 
| Benutzt von:
- unbenutzt