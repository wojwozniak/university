use std::collections::HashMap;

fn stock_list(list_of_art: Vec<&str>, list_of_cat: Vec<&str>) -> String {
    if list_of_art.is_empty() || list_of_cat.is_empty() {
        return String::new();
    }

    let mut category_totals: HashMap<char, i32> = HashMap::new();

    list_of_art.iter().for_each(|&book| {
        if let Some((code, qty)) = book.split_once(' ') {
            if let (Some(first_char), Ok(quantity)) = (code.chars().next(), qty.parse::<i32>()) {
                *category_totals.entry(first_char).or_insert(0) += quantity;
            }
        }
    });

    list_of_cat
        .into_iter()
        .map(|cat| {
            let count = category_totals
                .get(&cat.chars().next().unwrap_or('\0'))
                .copied()
                .unwrap_or(0);
            format!("({} : {})", cat, count)
        })
        .collect::<Vec<_>>()
        .join(" - ")
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_basic_functionality() {
        let stocklist = vec!["ABART 20", "CDXEF 50", "BKWRK 25", "BTSQZ 89", "DRTYM 60"];
        let categories = vec!["A", "B", "C", "W"];
        assert_eq!(
            stock_list(stocklist, categories),
            "(A : 20) - (B : 114) - (C : 50) - (W : 0)"
        );
    }

    #[test]
    fn test_empty_stocklist() {
        let stocklist: Vec<&str> = vec![];
        let categories = vec!["A", "B", "C", "W"];
        assert_eq!(stock_list(stocklist, categories), "");
    }

    #[test]
    fn test_empty_categories() {
        let stocklist = vec!["ABART 20", "CDXEF 50", "BKWRK 25", "BTSQZ 89", "DRTYM 60"];
        let categories: Vec<&str> = vec![];
        assert_eq!(stock_list(stocklist, categories), "");
    }

    #[test]
    fn test_no_matching_categories() {
        let stocklist = vec!["ABART 20", "CDXEF 50", "BKWRK 25", "BTSQZ 89", "DRTYM 60"];
        let categories = vec!["X", "Y", "Z"];
        assert_eq!(
            stock_list(stocklist, categories),
            "(X : 0) - (Y : 0) - (Z : 0)"
        );
    }

    #[test]
    fn test_partial_matching_categories() {
        let stocklist = vec!["ABART 20", "CDXEF 50", "BKWRK 25", "BTSQZ 89", "DRTYM 60"];
        let categories = vec!["A", "B", "X"];
        assert_eq!(
            stock_list(stocklist, categories),
            "(A : 20) - (B : 114) - (X : 0)"
        );
    }
}
