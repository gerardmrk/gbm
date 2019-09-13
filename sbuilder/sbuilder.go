package sbuilder

import (
	"fmt"
	"strings"
)

// Misleading
func StringJoin(ss []string) string {
	tmp := make([]string, len(ss))
	copy(tmp, ss)
	str := strings.Join(tmp, "\n")
	return str
}

func StringConcat(ss []string) string {
	var str string
	for i, ln := 0, len(ss); i < ln; i++ {
		str += ss[i]
		str += "\n"
	}
	return str
}

func StringSprintf(ss []string) string {
	var str string
	for i, ln := 0, len(ss); i < ln; i++ {
		str = fmt.Sprintf("%s%s\n", str, ss[i])
	}
	return str
}

func StringBuilder(ss []string) string {
	var b strings.Builder
	for i, ln := 0, len(ss); i < ln; i++ {
		_, _ = b.WriteString(ss[i])
		_, _ = b.WriteString("\n")
	}
	return b.String()
}

func StringBuilderFixedSize(ss []string, size int) string {
	var b strings.Builder
	b.Grow(size + len(ss)) // for newline
	for i, ln := 0, len(ss); i < ln; i++ {
		_, _ = b.WriteString(ss[i])
		_, _ = b.WriteString("\n")
	}
	return b.String()
}

func StringBuilderBytes(bbb [][]byte) string {
	var b strings.Builder
	for i, ln := 0, len(bbb); i < ln; i++ {
		_, _ = b.Write(bbb[i])
		_, _ = b.Write([]byte{10})
	}
	return b.String()
}

func StringBuilderBytesFixedSize(bbb [][]byte, size int) string {
	var b strings.Builder
	b.Grow(size + len(bbb)) // for newline
	for i, ln := 0, len(bbb); i < ln; i++ {
		_, _ = b.Write(bbb[i])
		_, _ = b.Write([]byte{10})
	}
	return b.String()
}
