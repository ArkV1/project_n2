import time
import os
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler
import subprocess
import logging

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(message)s')

class LayoutExtractor(FileSystemEventHandler):
    def __init__(self):
        self.layout_file = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'layout.txt')
        self.tree_config_file = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'tree_config.txt')
        self.ensure_files_exist()
        self.extract_layout()  # Extract layout on initialization

    def ensure_files_exist(self):
        if not os.path.exists(self.tree_config_file):
            with open(self.tree_config_file, 'w') as f:
                f.write('-L 4 --charset ascii -I "venv|__pycache__|*.pyc|*.pyo|*.pyd|.git|.idea|.vscode|*.egg-info" --dirsfirst')

    def on_any_event(self, event):
        # Ignore directory events, .git directory, and layout.txt file
        if (event.is_directory or 
            '.git' in event.src_path or 
            event.src_path == self.layout_file):
            return
        
        logging.info(f"Change detected: {event.src_path}")
        self.extract_layout()

    def extract_layout(self):
        try:
            # Add initial text to the layout file
            with open(self.layout_file, 'w') as f:
                f.write("Layout extraction started at: " + time.strftime("%Y-%m-%d %H:%M:%S") + "\n\n")
            
            # Read tree command options from config file
            with open(self.tree_config_file, 'r') as f:
                tree_options = f.read().strip()
            
            # Run tree command from the parent directory and append output to layout.txt
            parent_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
            command = f'tree {tree_options}'
            with open(self.layout_file, 'a') as f:
                result = subprocess.run(command, 
                                        cwd=parent_dir,
                                        stdout=f, 
                                        stderr=subprocess.PIPE, 
                                        text=True, 
                                        shell=True,
                                        check=True)
            logging.info(f"Layout extracted to {self.layout_file}")
        except subprocess.CalledProcessError as e:
            logging.error(f"Error running tree command: {e}")
            logging.error(f"Error: {e.stderr}")
        except IOError as e:
            logging.error(f"Error writing to file: {e}")

if __name__ == "__main__":
    # Get the parent directory (one level up from .tools)
    script_dir = os.path.dirname(os.path.abspath(__file__))
    parent_dir = os.path.dirname(script_dir)
    
    event_handler = LayoutExtractor()
    observer = Observer()
    observer.schedule(event_handler, parent_dir, recursive=True)
    observer.start()

    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()