#!/bin/bash

# Update the package list
sudo apt update

# Install prerequisites
sudo apt install -y software-properties-common

# Add deadsnakes PPA for Python 3.10 (or another version if you prefer)
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update

# Install Python 3.10
sudo apt install -y python3.10 python3.10-venv python3.10-dev python3-pip

# Ensure pip is up-to-date
python3.10 -m pip install --upgrade pip

# Create a virtual environment for the project
python3.10 -m venv myenv

# Activate the virtual environment
source myenv/bin/activate

# Function to display the menu and get user choices
show_menu() {
    echo "Select the packages you want to install (separate choices with spaces):"
    echo "1) FastAPI"
    echo "2) pandas"
    echo "3) scikit-learn"
    echo "4) NumPy"
    echo "5) SciPy"
    echo "6) Matplotlib"
    echo "7) Seaborn"
    echo "8) TensorFlow"
    echo "9) PyTorch"
    echo "10) Jupyter"
    echo "11) uvicorn"
    echo "12) joblib"
    echo "13) All of the above"
    echo "14) Exit"
    read -p "Enter your choices (e.g., 1 2 3): " choices
}

# Function to install selected packages
install_packages() {
    for choice in $choices; do
        case $choice in
            1)
                packages+=" fastapi"
                ;;
            2)
                packages+=" pandas"
                ;;
            3)
                packages+=" scikit-learn"
                ;;
            4)
                packages+=" numpy"
                ;;
            5)
                packages+=" scipy"
                ;;
            6)
                packages+=" matplotlib"
                ;;
            7)
                packages+=" seaborn"
                ;;
            8)
                packages+=" tensorflow"
                ;;
            9)
                packages+=" torch"
                ;;
            10)
                packages+=" jupyter"
                ;;
            11)
                packages+=" uvicorn"
                ;;
            12)
                packages+=" joblib"
                ;;
            13)
                packages+=" fastapi pandas scikit-learn numpy scipy matplotlib seaborn tensorflow torch jupyter uvicorn joblib"
                break
                ;;
            14)
                echo "Exiting."
                exit 0
                ;;
            *)
                echo "Invalid choice: $choice. Please try again."
                ;;
        esac
    done

    if [ ! -z "$packages" ]; then
        pip install $packages
    fi
}

# Main loop to show menu and install packages
while true; do
    show_menu
    install_packages
    break
done

echo "Installation complete."
