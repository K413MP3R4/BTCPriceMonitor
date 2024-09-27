#!/bin/bash

# Use ANSI escape codes for yellow text
YELLOW='\033[1;33m'
RESET='\033[0m'

# Bitcoin ASCII art
echo -e "${YELLOW}"
echo "            ⢀⣀⣤⣴⣶⣶⣶⣶⣦⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀"⠀
echo "  ⠀⠀⠀⠀⠀⠀⣀⣤⣾⣿⡿⠿⠛⠛⠛⠛⠛⠛⠻⢿⣿⣿⣦⣄⠀⠀⠀⠀⠀⠀"
echo "  ⠀⠀⠀⠀⢠⣼⣿⡿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠿⣿⣷⣄⠀⠀⠀⠀"
echo "  ⠀⠀⠀⣰⣿⡿⠋⠀⠀⠀⠀⠀⣿⡇⠀⢸⣿⡇⠀⠀⠀⠀⠀⠈⢿⣿⣦⡀⠀⠀"
echo "  ⠀⠀⣸⣿⡿⠀⠀⠀⠸⠿⣿⣿⣿⡿⠿⠿⣿⣿⣿⣶⣄⠀⠀⠀⠀⢹⣿⣷⠀⠀"
echo "  ⠀⢠⣿⡿⠁⠀⠀⠀⠀⠀⢸⣿⣿⡇⠀⠀⠀⠈⣿⣿⣿⠀⠀⠀⠀⠀⢹⣿⣧⠀"
echo "  ⠀⣾⣿⡇⠀⠀⠀⠀⠀⠀⢸⣿⣿⡇⠀⠀⢀⣠⣿⣿⠟⠀⠀⠀⠀⠀⠈⣿⣿⠀"
echo "  ⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⢸⣿⣿⡿⠿⠿⠿⣿⣿⣥⣄⠀⠀⠀⠀⠀⠀⣿⣿⠀"
echo "  ⠀⢿⣿⡇⠀⠀⠀⠀⠀⠀⢸⣿⣿⡇⠀⠀⠀⠀⢻⣿⣿⣧⠀⠀⠀⠀⢀⣿⣿⠀"
echo "  ⠀⠘⣿⣷⡀⠀⠀⠀⠀⠀⢸⣿⣿⡇⠀⠀⠀⠀⣼⣿⣿⡿⠀⠀⠀⠀⣸⣿⡟⠀"
echo "  ⠀ ⢹⣿⣷⡀⠀⠀⢰⣶⣿⣿⣿⣷⣶⣶⣾⣿⣿⠿⠛⠁⠀⠀⠀⣸⣿⡿⠀⠀"
echo "  ⠀⠀ ⠹⣿⣷⣄⠀⠀⠀⠀⠀⣿⡇⠀⢸⣿⡇⠀⠀⠀⠀⠀⢀⣾⣿⠟⠁⠀⠀"
echo "  ⠀⠀  ⠘⢻⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣾⣿⡿⠋⠀⠀⠀⠀"
echo "  ⠀⠀⠀⠀  ⠈⠛⢿⣿⣷⣶⣤⣤⣤⣤⣤⣤⣴⣾⣿⣿⠟⠋⠀⠀⠀⠀⠀⠀"
echo "  ⠀⠀⠀⠀⠀⠀    ⠈⠉⠛⠻⠿⠿⠿⠿⠟⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo -e "${RESET}"

# Glowing text message
echo -e "${YELLOW}₿itcoin${RESET}"


#!/bin/bash

# Couleur rouge
RED='\033[1;31m'
# Réinitialise la couleur
NC='\033[0m'

# Logo ASCII de Kali Linux
echo -e "${RED}
 ▄▄▄ ▄▄▄                   
█████████                  
 ▀█████▀                   
  ▀███▀ ${NC}"  # Ici, on ferme la chaîne de caractères et on ajoute NC pour réinitialiser la couleur   
  
  
  #!/bin/bash

API_URL="https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1"

response=$(curl -s $API_URL)

echo "Top 10 Cryptocurrencies:"
echo "$response" | jq -r '.[] | "\(.name) (\(.symbol)) - $ \(.current_price)"'

#!/bin/bash

# Colors for the banner
CYAN='\033[1;36m'
RED='\033[1;31m'
NC='\033[0m'  # Default color

# User-configurable settings
currency="EUR"           # Default currency to convert BTC price
threshold=5              # Percentage threshold for price change alerts
bitcoin_owned=0.5        # User's Bitcoin portfolio for tracking
telegram_bot_token="your_telegram_bot_token"  # Your Telegram Bot API token
telegram_chat_id="your_chat_id"               # Your Telegram Chat ID

# Function to get Bitcoin prices in USD and EUR
get_bitcoin_prices() {
    response=$(curl -s "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd,eur")

    # Extract the prices using jq
    price_usd=$(echo $response | jq -r '.bitcoin.usd')
    price_eur=$(echo $response | jq -r '.bitcoin.eur')

    # Check if the prices were fetched correctly
    if [ -z "$price_usd" ] || [ -z "$price_eur" ]; then
        echo -e "${RED}Error: Unable to fetch Bitcoin prices.${NC}"
    else
        echo -e "${CYAN}The current price of Bitcoin is:${NC}"
        echo -e "${CYAN}USD: \$${price_usd}${NC}"
        echo -e "${CYAN}EUR: €${price_eur}${NC}"
    fi
}

# Function to send Telegram message
send_telegram_message() {
    message=$1
    curl -s -X POST "https://api.telegram.org/bot$telegram_bot_token/sendMessage" -d chat_id=$telegram_chat_id -d text="$message" > /dev/null
}

# Function to check for price alerts
price_alert() {
    old_price=$1
    new_price=$2
    change=$(echo "scale=2; (($new_price - $old_price) / $old_price) * 100" | bc)

    if (( $(echo "$change > $threshold" | bc -l) )); then
        alert_message="Price increased by ${change}%! New price: \$${new_price}"
        echo -e "${CYAN}$alert_message${NC}"
        espeak "$alert_message"
        send_telegram_message "$alert_message"
    elif (( $(echo "$change < -$threshold" | bc -l) )); then
        alert_message="Price decreased by ${change}%! New price: \$${new_price}"
        echo -e "${RED}$alert_message${NC}"
        espeak "$alert_message"
        send_telegram_message "$alert_message"
    fi
}

# Function to display historical price
get_historical_price() {
    date=$1  # Format: dd-mm-yyyy
    history_response=$(curl -s "https://api.coingecko.com/api/v3/coins/bitcoin/history?date=$date")
    historical_price=$(echo $history_response | jq -r '.market_data.current_price.usd')
    echo -e "${CYAN}Bitcoin price on $date: \$${historical_price} USD${NC}"
}

# Function to track portfolio value
track_portfolio() {
    total_value=$(echo "$bitcoin_owned * $price_usd" | bc)
    echo -e "${CYAN}Your portfolio value is: \$${total_value} USD${NC}"
}

# Display the banner with Bitcoin prices
echo -e "${CYAN}"
echo "#############################################"
echo "#                                           #"
echo "#   BITCOIN BANNER - REAL-TIME PRICE        #"
echo "#                                           #"
echo "#############################################"
echo -e "${NC}"

# Get initial Bitcoin prices
old_price_usd=$(curl -s "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd" | jq -r '.bitcoin.usd')

# Run the script continuously with updates every 60 seconds
while true; do
    get_bitcoin_prices
    track_portfolio

    # Check for price change alerts
    price_alert "$old_price_usd" "$price_usd"
    old_price_usd=$price_usd


  get_historical_price "bitcoin" "12-01-2021"

    echo "For more information on Bitcoin price trends:"
    echo "Check the live chart on TradingView: https://www.tradingview.com/symbols/BTCUSD/"

    # Update every 60 seconds
    sleep 60
done

# CoinGecko API URL to get the top 10 cryptocurrencies by market cap
API_URL="https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1"

# Send a request to the API and retrieve the result in JSON format
response=$(curl -s $API_URL)

# Maximum bar width for the graph
MAX_BAR_WIDTH=50

# Function to display a simple graph in the terminal with price and percentage change
draw_graph() {
    echo "$1" | while IFS= read -r line; do
        name=$(echo "$line" | awk '{print $1}')
        price=$(echo "$line" | awk '{print $2}')
        change=$(echo "$line" | awk '{print $3}')
        # Calculate the width of the bar based on the price
        bar_width=$(echo "$price" | awk '{printf("%d", $1/1000)}')
        if [ "$bar_width" -gt "$MAX_BAR_WIDTH" ]; then
            bar_width=$MAX_BAR_WIDTH
        fi
        bar=$(printf "%${bar_width}s" | tr ' ' '#')
        printf "%-20s | %s $%s (24h change: %s%%)\n" "$name" "$bar" "$price" "$change"
    done
}

# Extract cryptocurrency info and display the graph
echo "Top 10 Cryptocurrencies (Price and 24h change):"
echo "$response" | jq -r '.[] | "\(.name) \(.current_price) \(.price_change_percentage_24h)"' | draw_graph

