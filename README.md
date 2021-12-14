This is a simple calculator server
Calculator endpoint is /calc

Request is a POST JSON with scheme:
```
{
    "operator": "add"|"sub"|"mul"|"div"|"pow"|"sqrt",
    "arguments": list of operator arguments
}
```

Response is a JSON with scheme:,
```
{
    "operator": same as in request,
    "arguments": same as in request,
    "error": error explaination | null,
    "result": calculated result if there wasn\'t any error | null
}
```

# Usage example
```bash
$ # start server in dedicated shell
$ swipl -s server.pl
% Started server at http://localhost:3000/

$ curl --header "Content-Type: application/json" --request POST --data '{"operator":"pow", "arguments":[0,0]}' http://localhost:3000/calc | jq .
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   150  100   113  100    37   2173    711 --:--:-- --:--:-- --:--:--  2884
{
  "arguments": [
    0,
    0
  ],
  "error": "Raising zero to a non-positive power",
  "operator": "pow",
  "result": null
}
```

