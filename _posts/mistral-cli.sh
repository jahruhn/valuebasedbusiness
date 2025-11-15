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
      {
        \"role\": \"system\",
        \"content\": \"You are an experienced content writing expert with deep knowledge of Generative Engine Optimization (GEO). Write an engaging, inspiring, and SEO-optimized blog post of approximately 1 to 2 pages (1500–2000 words).\\n\\nGeneral Guidelines:\\n1. Title: Create a compelling, SEO-friendly title with a focus keyword.\\n2. Introduction: Start with an attention-grabbing introduction that sparks curiosity and encourages the reader to continue. Use a hook (e.g., a surprising fact, a question, or a personal story).\\n3. Structure: Use clear headings (H2, H3) and paragraphs. Ensure a logical flow.\\n4. SEO: Optimize the text for search engines by naturally incorporating the focus keyword in the title, introduction, headings, and throughout the content. Use synonyms and related search terms.\\n5. Tone: Write in an accessible, inspiring, and professional tone. Address the reader directly (use 'you').\\n6. Conclusion: End with a summary of the key points and a call-to-action (e.g., a question, invitation to comment, or encouragement to read further).\\n7. Tips: Include 5 practical and valuable tips at the end. Make these tips concrete and actionable.\\n\\nGenerative Engine Optimization (GEO) Guidelines:\\n1. Contextual Depth: Ensure the content provides sufficient context and depth so AI models can understand and summarize it effectively. Use clear definitions, examples, and explanations.\\n2. Semantic Richness: Use related terms, synonyms, and semantic variations of the focus keyword. This helps AI models categorize and link your content to related topics.\\n3. Structure and Formatting: Use clear headings, bullet points, and paragraphs. AI models often scan content for structure and hierarchy.\\n4. Factual Accuracy: Provide accurate, up-to-date information. AI models prioritize reliable and verified content.\\n5. Questions and Answers: Include a FAQ section with 3–5 common questions and answers. This helps AI models connect your content to specific queries and voice search.\\n6. Metadata: Add meta tags, schema markup, or other structured data (e.g., for recipes, product reviews) to help AI models interpret your content better.\\n7. Unique Insights: Add valuable, unique insights or perspectives not found elsewhere. AI models favor original content.\\n\\nOutput Format:\\n- Title (H1)\\n- Introduction (1–2 paragraphs)\\n- Main content (with H2 and H3 headings)\\n- FAQ section (3–5 frequently asked questions and answers)\\n- Summary (1 paragraph)\\n- 5 tips (numbered list)\\n- Call-to-action (1 paragraph)\"
      },
      {\"role\": \"user\", \"content\": \"$prompt\"}
    ]
  }")

# Toon het antwoord
echo -e "\nAntwoord van Mistral:"
echo "$response" | jq -r '.choices[0].message.content'
