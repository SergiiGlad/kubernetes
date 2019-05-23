Below are some examples using jsonpath:

```shell
$ kubectl get pods -o json
$ kubectl get pods -o=jsonpath='{@}'
$ kubectl get pods -o=jsonpath='{.items[0]}'
$ kubectl get pods -o=jsonpath='{.items[0].metadata.name}'
$ kubectl get pods -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.status.startTime}{"\n"}{end}'
```
## Output options

Use the following sections for information about how you can format or sort the output of certain commands. For details about which commands support the various output options, see the [kubectl](/docs/user-guide/kubectl/) reference documentation.

### Formatting output

The default output format for all `kubectl` commands is the human readable plain-text format. To output details to your terminal window in a specific format, you can add either the `-o` or `-output` flags to a supported `kubectl` command.

#### Syntax

```shell
kubectl [command] [TYPE] [NAME] -o=<output_format>
```

Depending on the `kubectl` operation, the following output formats are supported:

Output format | Description
--------------| -----------
`-o=custom-columns=<spec>` | Print a table using a comma separated list of [custom columns](#custom-columns).
`-o=custom-columns-file=<filename>` | Print a table using the [custom columns](#custom-columns) template in the `<filename>` file.
`-o=json`     | Output a JSON formatted API object.
`-o=jsonpath=<template>` | Print the fields defined in a [jsonpath](/docs/user-guide/jsonpath) expression.
`-o=jsonpath-file=<filename>` | Print the fields defined by the [jsonpath](/docs/user-guide/jsonpath) expression in the `<filename>` file.
`-o=name`     | Print only the resource name and nothing else.
`-o=wide`     | Output in the plain-text format with any additional information. For pods, the node name is included.
`-o=yaml`     | Output a YAML formatted API object.

##### Example

In this example, the following command outputs the details for a single pod as a YAML formatted object:

`$ kubectl get pod web-pod-13je7 -o=yaml`

Remember: See the [kubectl](/docs/user-guide/kubectl/) reference documentation for details about which output format is supported by each command.

#### Custom columns

To define custom columns and output only the details that you want into a table, you can use the `custom-columns` option. You can choose to define the custom columns inline or use a template file: `-o=custom-columns=<spec>` or `-o=custom-columns-file=<filename>`.

##### Examples

Inline:

```shell
$ kubectl get pods <pod-name> -o=custom-columns=NAME:.metadata.name,RSRC:.metadata.resourceVersion
```

Template file:

```shell
$ kubectl get pods <pod-name> -o=custom-columns-file=template.txt
```

where the `template.txt` file contains:

```
NAME                    RSRC
      metadata.name           metadata.resourceVersion
```
The result of running either command is:

```shell
NAME           RSRC
submit-queue   610995
```

### Sorting list objects

To output objects to a sorted list in your terminal window, you can add the `--sort-by` flag to a supported `kubectl` command. Sort your objects by specifying any numeric or string field with the `--sort-by` flag. To specify a field, use a [jsonpath](/docs/user-guide/jsonpath) expression.

#### Syntax

```shell
kubectl [command] [TYPE] [NAME] --sort-by=<jsonpath_exp>
```

##### Example

To print a list of pods sorted by name, you run:

`$ kubectl get pods --sort-by=.metadata.name`
