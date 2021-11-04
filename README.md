# sheets-phrase

## Setup
### Google Cloud project and credentials
1. Create a Google Cloud project
2. Enable Google Drive API and Google Sheets API
3. Create a [Service account](https://github.com/gimite/google-drive-ruby/blob/master/doc/authorization.md#service-account)
4. Download json credentials to `secrets` folder
5. Grant the service user access to the Google Spreasheets to read/write

### Phrase
1. Sign in to your Phrase account
2. Create a read/write API key and copy the value
3. Paste the API key value in plain text to a `.phrase` file into `secrets`, eg:
   ```bash
   $ echo "[PHRASE_API_KEY]" > ./secrets/.test
   ```
