#!/usr/bin/env python3

symbol_backup = "󰁯"
symbol_dot = "·"
color_symbol = "%{F#F0C674}"
color_normal = "%{F-}"
color_correct = "%{F#00C674}"
color_warning = "%{F#ED9638}"
color_error = "%{F#A54242}"

try:
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument(
        '--backup_status_file', required=True, type=argparse.FileType('r')
    )
    args = parser.parse_args()

    import json
    all_status = json.load(args.backup_status_file)
    args.backup_status_file.close()


    from datetime import datetime, timezone
    from dateutil.parser import isoparse

    now = datetime.now(timezone.utc)
    backup_status = all_status['profiles']['default']['backup']
    last_backup = now - isoparse(backup_status['time'])
    total_gbytes = f"{backup_status['bytes_total'] / 1_000_000_000:.0f}"

    def how_long_ago(timedelta):
        secs = timedelta.total_seconds()
        if secs < 60:
            return f"{int(secs)} seconds"
        elif secs < 3600:
            return f"{int(secs//60)} minutes"
        elif secs < 2600 * 24:
            return f"{int(secs//3600)} hours"
        else:
            return f"{secs.days} days"


    if backup_status['success']:
        if last_backup.days > 2:
            print(f"{color_symbol}{symbol_backup} {color_warning}{how_long_ago(last_backup)} ago {color_normal}{symbol_dot} {total_gbytes}GB")
        elif last_backup.days > 7:
            print(f"{color_symbol}{symbol_backup} {color_error}{how_long_ago(last_backup)} ago {color_normal}{symbol_dot} {total_gbytes}GB")
        else:
            print(f"{color_symbol}{symbol_backup} {color_normal}{how_long_ago(last_backup)} ago {color_normal}{symbol_dot} {total_gbytes}GB")
    else:
        err = backup_status['stderr']
        if len(err) > 10:
            err = err[10] + '...'
        print(f"{color_error}{symbol_backup} {color_error}Error: {err}")

except Exception as e:
    print(f"{color_error}{symbol_backup} Error with script")
