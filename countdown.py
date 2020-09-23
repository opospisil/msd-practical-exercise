import argparse

def inspect(n):
  if(n%3 == 0 and n%5 == 0):
    print(n, "testing")
  elif(n%3 == 0):
    print(n, "software")
  elif(n%5 == 0):
    print(n, "agile")
  else:
    print(n)

def countdown_and_print(nr):
  inspect(nr)
  if nr <= 0:
    print("Reached 0 or started at negative number, exiting")
    return
  return(countdown_and_print(nr - 1))

parser = argparse.ArgumentParser()
parser.add_argument('start', const=1, type=int, default=100, nargs='?')
args = parser.parse_args()

countdown_and_print(args.start)
