vim9script

sign_define("TodaySign", {
    "text": ">>",
    "texthl": "Search",
    # "linehl": "DiffAdd",
})

def g:SRSign()
    sign_unplace("SRGroup")
    const now = localtime()
    const lines = getline(1, '$')
    for idx in range(len(lines))
        if lines[idx][ : 5] != '% SR: '
            continue
        endif
        const line_split = lines[idx][6 : ]->split()
        const scheduled = float2nr(strptime("%Y-%m-%dT%H:%M:%S%z", line_split[0]) + str2float(line_split[1]) * 24 * 60 * 60)
        if now > scheduled
            sign_place(0, "SRGroup", "TodaySign", bufnr(), {lnum: idx + 1})
        endif
    endfor
enddef

def g:SRQuickFix()
    const now = localtime()
    final qf_list = []
    for file_path in glob('*.tex', 1, 1)
        if file_path < "lecture_07"
            continue
        endif
        const file_lines = readfile(file_path)
        for idx in range(len(file_lines))
            if file_lines[idx][ : 5] != '% SR: '
                continue
            endif
            var line_split = file_lines[idx][6 : ]->split()
            var scheduled = float2nr(strptime("%Y-%m-%dT%H:%M:%S%z", line_split[0]) + str2float(line_split[1]) * 24 * 60 * 60)
            if now > scheduled
                qf_list->add({
                    filename: fnamemodify(file_path, ':p'),
                    lnum: idx + 1,
                    text: strftime("%Y-%m-%dT%H:%M:%S%z ", scheduled) .. file_lines[idx + 1]->substitute('\\begin{\(.[^}]\+\)}\[\(.*\)\]', '\1: \2', ''),
                    scheduled: scheduled,
                })
            endif
        endfor
    endfor

    #qf_list->sort((a, b) => a.scheduled - b.scheduled)

    if !empty(qf_list)
        setqflist(qf_list, 'r')
        copen
        echo $"Found {len(qf_list)} items across all .tex files."
    else
        cclose
        echo "No SR tasks found for now."
    endif
enddef

def g:SRReview()
    var line_split = getline('.')[6 : ]->split()
    var interval = str2float(line_split[1])
    var easiness_factor = str2float(line_split[2])
    var quality = str2nr(line_split[3])
    var new_interval = interval * easiness_factor
    var new_easiness_factor = easiness_factor + (0.1 - (5 - quality) * (0.08 + (5 - quality) * 0.02))
    setline('.', $'% SR: {strftime('%Y-%m-%dT%H:%M:%S%z')} {printf("%.02f", new_interval)} {printf("%.02f", new_easiness_factor)} {quality}')
enddef


nnoremap <localleader>sq <CMD>call SRQuickFix()<CR>
nnoremap <localleader>sr <CMD>call SRReview()<CR>
nnoremap <localleader>ss <CMD>call SRSign()<CR>

# vim: et sts=4 sw=4
