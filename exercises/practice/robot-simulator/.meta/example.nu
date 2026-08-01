const directions: list<string> = [north east south west]
const offsets: list<list<number>> = [[0 1] [1 0] [0 -1] [-1 0]]
def indexof [item: any]: list<any> -> number {
  $in | enumerate | where $it.item == $item | get index.0
}
def advance [robot: record<position: record<x: int, y: int>, direction: string>] {
  let change = $offsets | get ($directions | indexof $robot.direction | into cell-path)
  $robot | update position ({x: ($robot.position.x + $change.0), y: ($robot.position.y + $change.1)})
}
def turnr [robot: record<position: record<x: int, y: int>, direction: string>] {
  let idx = $directions | indexof $robot.direction
  $robot | update direction ($directions | get (($idx + 1) mod 4 | into cell-path))
}
def turnl [robot: record<position: record<x: int, y: int>, direction: string>] {
  let idx = $directions | indexof $robot.direction
  $robot | update direction ($directions | get (($idx - 1) mod 4 | into cell-path))
}
export def move [instructions: string]: record<position: record<x: int, y: int>, direction: string> -> record<position: record<x: int, y: int>, direction: string> {
  let robot = $in
  $instructions | split chars | reduce --fold $robot {|c, robot|
    match $c {
      "A" => (advance $robot),
      "R" => (turnr $robot),
      "L" => (turnl $robot),
    }
  }
}
