#!/usr/bin/env php
<?php

if ($argc < 2) {
	die($argv[0] . " <tag>\n");
}

$tag = $argv[1];

$file = file_get_contents('composer.json.skeleton');
$file = str_replace(array("##BRANCH##", "##REQBRANCH##"), array($tag, $tag), $file);

file_put_contents('composer.json', $file);
