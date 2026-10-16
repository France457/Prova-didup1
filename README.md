# Diario scolastico

## Pubblicazione per iPhone, Android e PC

Per usare il diario ovunque serve pubblicarlo su un hosting HTTPS. Il progetto include una configurazione pronta per Render.

1. Se una chiave Gemini è già stata incollata in `index.html` o condivisa, revocala in Google AI Studio e creane una nuova.
2. Crea un repository **privato** su GitHub e carica i file di questo progetto. Non inserire chiavi o password nei file.
3. In Render crea un nuovo **Blueprint** e collegalo al repository GitHub: Render leggerà `render.yaml`.
4. Quando richiesto, inserisci `GEMINI_API_KEY` con la nuova chiave e `APP_PASSWORD` con una password lunga e unica per proteggere il sito. Render genera `SESSION_SECRET`; lascia `SESSION_COOKIE_SECURE` impostata a `true`.
5. Avvia il deploy. Render fornirà un indirizzo HTTPS: aprilo da PC o telefono e accedi con `APP_PASSWORD`.

La chiave Gemini resta sul server e non viene inviata al browser. La password protegge l'accesso al diario e alla chat; non condividerla. Per usare l'app come icona:

- **iPhone/iPad:** apri l'indirizzo in Safari, tocca **Condividi** e poi **Aggiungi alla schermata Home**.
- **Android:** apri l'indirizzo in Chrome, apri il menu ⋮ e scegli **Installa app** o **Aggiungi a schermata Home**.
- **PC:** apri lo stesso indirizzo nel browser; la PWA può essere installata dal pulsante di installazione del browser.

Il file `render.yaml` imposta un servizio web gratuito, che può andare in sospensione quando non viene usato. Il primo accesso dopo la sospensione può quindi richiedere più tempo. Per aggiornare il sito, carica le modifiche nel repository: Render avvierà un nuovo deploy.

## Avvio locale

Copia `.env.example` in `.env`, inserisci i tuoi valori nel file `.env` e fai doppio clic su `Avvia Diario.bat`. Per saltare la password dell'app solo sul PC locale, imposta `LOCAL_AUTH_BYPASS=true`: il bypass vale esclusivamente per connessioni locali e non si applica a un deploy online. Il file `.env` è escluso da Git: non caricarlo né inviarlo a nessuno. L'avvio locale non pubblica il sito su Internet e non sostituisce il deploy HTTPS descritto sopra.

Al primo accesso il diario chiede il codice scuola e le credenziali Argo per importare compiti e promemoria reali. Le credenziali vengono inviate al server del diario e inoltrate ad Argo per la richiesta; l'app non le salva. Usa questa funzione soltanto con una tua installazione privata pubblicata via HTTPS: chi amministra il server può comunque gestire le richieste che lo attraversano. La libreria Argo utilizzata è un progetto non ufficiale e non più aggiornato, quindi eventuali modifiche al servizio Argo potrebbero interrompere l'importazione.

Compiti importati, promemoria e compiti completati restano salvati nel browser del singolo dispositivo e non si sincronizzano tra telefono e PC. Per aggiornare i dati o collegare un altro account, apri **Account** e usa il modulo Argo: la nuova importazione sostituisce i dati importati in precedenza. L'uso dell'API Gemini può essere soggetto a limiti o costi Google.

Nella sezione **Compiti** puoi anche aggiungere consegne manuali: materia, titolo, descrizione, scadenza e priorità vengono salvati nel browser del dispositivo e restano separati dai dati importati da Argo.

La sezione **Promemoria** offre filtri per oggi, prossimi tre giorni e date successive, un calendario per filtrare un giorno specifico e un pulsante **Tutti** per ripristinare l'elenco completo. Puoi inoltre aggiungere promemoria con titolo, dettagli, data e orario; anche questi restano salvati localmente e separati dai dati Argo.

Il profilo (dati personali, preferenze, materie, obiettivo e immagini ridimensionate) viene salvato automaticamente nel browser del dispositivo. L'anno scolastico viene proposto in base alla data corrente (da settembre ad agosto); i campi del profilo si modificano cliccandoci sopra. Le opzioni cloud e notifiche sono mostrate come non disponibili: non inviano dati ad un servizio cloud e non generano notifiche in questa versione.
