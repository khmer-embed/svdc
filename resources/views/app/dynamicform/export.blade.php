@php
    use PhpOffice\PhpSpreadsheet\Spreadsheet;
    use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
    use PhpOffice\PhpSpreadsheet\IOFactory;
    use PhpOffice\PhpSpreadsheet\Cell\Coordinate;
    
    // setup require vars
    $title = 'export'; //$obj_info['title'];
    $filename = $title . '.xlsx';
    /* A = 65, a =97 */
    
    $title_row = 1;
    $head_row = $start_row = 3;
    $content_row = $head_row + 1;
    
    $count_column = count($tablecolumns);
    $start_cell = 'a';
    
    $spreadsheet = new Spreadsheet();
    #page setup
    $spreadsheet
        ->getActiveSheet()
        ->getPageSetup()
        ->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_PORTRAIT); // ORIENTATION_PORTRAIT, ORIENTATION_LANDSCAPE
    $spreadsheet
        ->getActiveSheet()
        ->getPageSetup()
        ->setPaperSize(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::PAPERSIZE_A4);
    $spreadsheet
        ->getActiveSheet()
        ->getPageSetup()
        ->setScale(65);
    $spreadsheet
        ->getActiveSheet()
        ->getPageMargins()
        ->setTop(0.75);
    $spreadsheet
        ->getActiveSheet()
        ->getPageMargins()
        ->setRight(0.25);
    $spreadsheet
        ->getActiveSheet()
        ->getPageMargins()
        ->setLeft(0.25);
    $spreadsheet
        ->getActiveSheet()
        ->getPageMargins()
        ->setBottom(0.75);
    
    //$spreadsheet->getActiveSheet()->getCellByColumnAndRow(2, 5)->setValue('xx');
    // dd($spreadsheet->getActiveSheet()->getCellByColumnAndRow(2, 5)->getCoordinate());
    // $columnLetter = Coordinate::stringFromColumnIndex(26); // Z
    
    $sheet = $spreadsheet->getActiveSheet();
    $spreadsheet->getActiveSheet()->setTitle('Dcx KOBO');
    
    #drawing header
    $column_index = 1;
    foreach ($tablecolumns as $column) {
        if ('_' != substr($column, 0, 1)) {
            $field_at_q = array_last(explode('/', $column));
            $col_name = strip_tags($questions[$field_at_q]->label_0 ?? $field_at_q);
            $spreadsheet
                ->getActiveSheet()
                ->getCellByColumnAndRow($column_index, $head_row)
                ->setValue($col_name);
            $column_index++;
        }
    }
    
    $end_column_letter = Coordinate::stringFromColumnIndex($column_index - 1);
    $end_cell = strtolower($end_column_letter);
    
    #drawing top Title
    $spreadsheet->getActiveSheet()->setCellValue($start_cell . $title_row, $title);
    $spreadsheet->getActiveSheet()->mergeCells($start_cell . $title_row . ':' . $end_cell . $title_row);
    $spreadsheet
        ->getActiveSheet()
        ->getStyle($start_cell . $title_row)
        ->applyFromArray([
            'font' => ['bold' => true, 'size' => 20],
            'alignment' => ['horizontal' => 'center', 'vertical' => 'bottom'],
        ]);
    
    #drawing content
    if ($results->count()) {
    
        foreach ($results as $row) {
			$cell_index = 1;
            foreach ($tablecolumns as $column) {
				$value = '';
                if ('_' != substr($column, 0, 1)) {
                    $field_at_q = array_last(explode('/', $column));
                    if (isset($questions[$field_at_q]) && !empty($questions[$field_at_q]->select_from_list_name)) {
                        $role = $questions[$field_at_q]->select_from_list_name . '_' . $row->$column;
                        $value = $choices[$role]->label_0 ?? '';
                    } else {
                        $value = $row->$column ?? '';
                    }

					$spreadsheet
					->getActiveSheet()
					->getCellByColumnAndRow($cell_index, $content_row)
					->setValue($value);
					$cell_index++;

                }
				/* end if*/
            }

			$content_row++;
        }
    }
    
    #download
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header('Content-Disposition: attachment; filename=' . str_replace(' ', '-', $filename));
    header('Cache-Control: max-age=0');
    
    $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
    $writer->save('php://output');
@endphp
