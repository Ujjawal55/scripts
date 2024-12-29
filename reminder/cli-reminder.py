import subprocess
import re


def takeQuery():
    while True:
        time = input("Enter the time in the format(24hr-format (HH:MM):  ")
        if re.match(r"^([01]\d|2[0-3]):([0-5]\d)$", time):
            break
        print("time format is wrong, please use (HH:MM)")

    text = input("Enter the query to be reminded(try to be concise): ")

    while True:
        choice = input("want to modify time or query(Y/N/y/n): ").lower()
        if choice in ["y", "n"]:
            break
        print("invalid choice. Please enter (Y/y/n/N)")

    if choice == "y":
        while True:
            modify_choice = input("1-time and 2-query and 3-both and 4-none: ")
            if modify_choice in ["1", "2", "3", "4"]:
                break
            print("invalid choice.")

        if modify_choice in ["1", "3"]:
            while True:
                time = input("Enter the time again: format(24hr-formate (00:00): ")
                if re.match(r"^([01]\d|2[0-3]):([0-5]\d)$", time):
                    break
                print("time format is wrong, please use (HH:MM)")

        if modify_choice in ["2", "3"]:
            text = input("Enter the query again(try to be concise): ")

    return [time, text]


def set_reminder():
    query = takeQuery()  # it is a list [time, message]
    duration = 20000  # this is the time variable for the remainder. you can change it (it is in miliseconds).
    command = f"dunstify -u urgent -t {duration} 'Reminder' {query[1]}"
    try:
        subprocess.run(f"echo {command} | at {query[0]}", shell=True, check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error occur while scheduling {e}")


def main():
    set_reminder()


if __name__ == "__main__":
    main()
