#!/bin/bash

# API-sleutel (vervang deze niet, tenzij je een nieuwe sleutel genereert)
API_KEY="huqgN5idIWlNxt8MZBminTHrYApfxvLK"
API_URL="https://api.mistral.ai/v1/chat/completions"

# Vraag de gebruiker om input
read -p "Voer je prompt in: " prompt

# Stuur de request naar de API
response=$(curl -s -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $API_KEY" \
  -d "{
    \"model\": \"mistral-medium\",
    \"messages\": [
      {\"role\": \"user\", \"content\": \"$prompt\"}
    ]
  }")

# Toon het antwoord
echo -e "\nAntwoord van Mistral:"
echo "$response" | jq -r '.choices[0].message.content'
