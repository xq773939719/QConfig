#!/bin/bash

# tmux快捷键帮助函数
show_tmux_shortcuts() {
    echo "=== tmux 窗格快捷键 ==="
    echo "Ctrl+b %：划分左右两个窗格"
    echo "Ctrl+b \"：划分上下两个窗格"
    echo "Ctrl+b <arrow key>：光标切换到其他窗格（<arrow key>是指向要切换到的窗格的方向键，比如切换到下方窗格，就按方向键↓）"
    echo "Ctrl+b ; 光标切换到上一个窗格"
    echo "Ctrl+b o 光标切换到下一个窗格"
    echo "Ctrl+b { 当前窗格与上一个窗格交换位置"
    echo "Ctrl+b } 当前窗格与下一个窗格交换位置"
    echo "Ctrl+b Ctrl+o 所有窗格向前移动一个位置，第一个窗格变成最后一个窗格"
    echo "Ctrl+b Alt+o 所有窗格向后移动一个位置，最后一个窗格变成第一个窗格"
    echo "Ctrl+b x 关闭当前窗格"
    echo "Ctrl+b ! 将当前窗格拆分为一个独立窗口"
    echo "Ctrl+b z 当前窗格全屏显示，再使用一次会变回原来大小"
    echo "Ctrl+b Ctrl+<arrow key> 按箭头方向调整窗格大小"
    echo "Ctrl+b q 显示窗格编号"
    echo ""
}

# 如果直接执行此脚本，则显示快捷键
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    show_tmux_shortcuts
fi