#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m'

show_help() {
    echo -e "${ORANGE}System Tray Manager${NC}"
    echo ""
    echo "Usage: $0 [option]"
    echo ""
    echo "Options:"
    echo "  start     Start common tray applications"
    echo "  stop      Stop tray applications"
    echo "  status    Show running tray applications"
    echo "  test      Test tray with sample applications"
    echo "  list      List available tray-enabled applications"
    echo "  help      Show this help message"
    echo ""
}

# Function to start common tray applications
start_tray_apps() {
    echo -e "${GREEN}Starting system tray applications...${NC}"
    
    # Network Manager Applet 
    if command -v nm-applet &> /dev/null; then
        echo "Starting Network Manager Applet..."
        nm-applet --indicator &
    fi
    
    # Bluetooth Manager 
    if command -v blueman-applet &> /dev/null; then
        echo "Starting Bluetooth Manager..."
        blueman-applet &
    fi
    
    # Volume Control (if pavucontrol available, create simple tray icon)
    if command -v pavucontrol &> /dev/null; then
        echo "Volume control available (pavucontrol - right click wireplumber module)"
    fi
    
    echo -e "${GREEN}System tray applications started!${NC}"
    echo "Check your Waybar for the tray icons."
}

# Function to stop tray applications
stop_tray_apps() {
    echo -e "${ORANGE}Stopping system tray applications...${NC}"
    
    # Kill common tray applications
    pkill -f "nm-applet" 2>/dev/null && echo "Stopped Network Manager Applet"
    pkill -f "blueman-applet" 2>/dev/null && echo "Stopped Bluetooth Manager"
    pkill -f "clipit" 2>/dev/null && echo "Stopped Clipboard Manager"
    pkill -f "copyq" 2>/dev/null && echo "Stopped CopyQ"
    
    echo -e "${ORANGE}Tray applications stopped.${NC}"
}

# Display if each applet is running
show_status() {
    echo -e "${GREEN}System Tray Status:${NC}"
    echo ""
    
    if pgrep -f "nm-applet" > /dev/null; then
        echo "✓ Network Manager Applet: Running"
    else
        echo "✗ Network Manager Applet: Not running"
    fi
    
    if pgrep -f "blueman-applet" > /dev/null; then
        echo "✓ Bluetooth Manager: Running"
    else
        echo "✗ Bluetooth Manager: Not running"
    fi
    
    echo ""
    echo -e "${ORANGE}Note: Some applications like Spotify, Discord, Signal,${NC}"
    echo -e "${ORANGE}and VLC will appear in tray when they are running.${NC}"
}

list_apps() {
    echo -e "${GREEN}Available tray-enabled applications:${NC}"
    echo ""
    
    echo "📱 Communication:"
    echo "  - Signal Desktop"
    echo "  - Discord"
    echo "  - Telegram Desktop"
    echo ""
    
    echo "🎵 Media:"
    echo "  - Spotify"
    echo "  - VLC Media Player"
    echo ""
    
    echo "🔧 System:"
    echo "  - Network Manager Applet (nm-applet)"
    echo "  - Bluetooth Manager (blueman-applet)"
    echo "  - Volume Control (pavucontrol)"
    echo ""
    
    echo "💡 Tip: Start these applications to see them in the system tray!"
}

# Function to test tray functionality
test_tray() {
    echo -e "${GREEN}Testing system tray functionality...${NC}"
    
    # Reload waybar to ensure changes are applied
    echo "Reloading Waybar..."
    ~/.config/waybar/launch.sh
    
    # Test with a simple notification
    echo "Sending test notification..."
    notify-send -u normal -t 3000 -a "System Tray Test" "System tray is working!" -i "dialog-information"
    
    # Start a simple tray app if available
    if command -v nm-applet &> /dev/null; then
        echo "Starting Network Manager Applet for testing..."
        nm-applet --indicator &
        sleep 2
        echo "You should see network icon in the tray now!"
    fi
    
    echo -e "${GREEN}Test complete! Check your Waybar for tray icons.${NC}"
}

case "$1" in
    "start")
        start_tray_apps
        ;;
    "stop")
        stop_tray_apps
        ;;
    "status")
        show_status
        ;;
    "test")
        test_tray
        ;;
    "list")
        list_apps
        ;;
    "help"|"--help"|"-h"|"")
        show_help
        ;;
    *)
        echo -e "${RED}Error: Unknown option '$1'${NC}"
        echo ""
        show_help
        exit 1
        ;;
esac
