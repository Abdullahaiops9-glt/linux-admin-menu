#!/bin/bash

echo "=== Linux Admin Menu Tool ==="

select option in "Disk Usage" "Memory" "Processes" "Exit"
do
  case $option in
    "Disk Usage")
      df -h
      ;;
    "Memory")
      free -m
      ;;
    "Processes")
      ps aux | head
      ;;
    "Exit")
      echo "Exiting..."
      break
      ;;
    *)
      echo "Invalid choice, try again."
      ;;
  esac
done
