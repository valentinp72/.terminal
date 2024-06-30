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
        '--backup_status_file', required=True, type=str,
    )
    args = parser.parse_args()

    import os
    import json

    if not os.path.isfile(args.backup_status_file):
        print(f"{color_warning}{symbol_backup} Restic not found")
        exit(0)
    with open(args.backup_status_file, 'r') as f:
        all_status = json.load(f)

    from datetime import datetime, timezone
    from dateutil.parser import isoparse

    now = datetime.now(timezone.utc)
    backup_status = all_status['profiles']['default']['backup']
    last_backup = now - isoparse(backup_status['time'])
    total_gbytes = f"{backup_status['bytes_total'] / 1_000_000_000:.0f}"

    def how_long_ago(timedelta):
        secs = timedelta.total_seconds()
        if secs < 60:
            n_seconds = int(secs)
            return f"{n_seconds} second{'s' if n_seconds > 1 else ''}"
        elif secs < 3600:
            n_minutes = int(secs // 60)
            return f"{n_minutes} minute{'s' if n_minutes > 1 else ''}"
        elif secs < 3600 * 24:
            n_hours = int(secs // 3600)
            return f"{n_hours} hour{'s' if n_hours > 1 else ''}"
        else:
            return f"{timedelta.days} day{'s' if timedelta.days > 1 else ''}"


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
